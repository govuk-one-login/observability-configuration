/*
TOTP Script yoinked from: 
MIT License
Copyright (c) 2018, Kevin Gut (https://cable.ayra.ch/contact)
This is a modified version by A99US (https://github.com/A99US/totp-js)
*/

var Convert = Convert || {};

//Converts a base32 string into a hex string. The padding is optional
Convert.base32toHex = function(data) {
    //Basic argument validation
    if (typeof(data) !== typeof("")) {
        throw new Error("Argument to base32toHex() is not a string");
    }
    if (data.length === 0) {
        throw new Error("Argument to base32toHex() is empty");
    }
    if (!data.match(/^[A-Z2-7]+=*$/i)) {
        throw new Error("Argument to base32toHex() contains invalid characters");
    }

    //Return value
    var ret = "";
    //Maps base 32 characters to their value (the value is the array index)
    var map = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567".split('');
    //Split data into groups of 8
    var segments = (data.toUpperCase() + "========").match(/.{1,8}/g);
    //Adding the "=" in the line above creates an unnecessary entry
    segments.pop();
    //Calculate padding length
    var strip = segments[segments.length - 1].match(/=*$/)[0].length;
    //Too many '=' at the end. Usually a padding error due to an incomplete base32 string
    if (strip > 6) {
        throw new Error("Invalid base32 data (too much padding)");
    }
    //Process base32 in sections of 8 characters
    for (var i = 0; i < segments.length; i++) {
        //Start with empty buffer each time
        var buffer = 0;
        var chars = segments[i].split("");
        //Process characters individually
        for (var j = 0; j < chars.length; j++) {
            //This is the same as a left shift by 32 characters but without the 32 bit JS int limitation
            buffer *= map.length;
            //Map character to real value
            var index = map.indexOf(chars[j]);
            //Fix padding by ignoring it for now
            if (chars[j] === '=') {
                index = 0;
            }
            //Add real value
            buffer += index;
        }
        //Pad hex string to 10 characters (5 bytes)
        var hex = ("0000000000" + buffer.toString(16)).substr(-10);
        ret += hex;
    }
    //Remove bytes according to the padding
    switch (strip) {
        case 6:
            return ret.substr(0, ret.length - 8);
        case 4:
            return ret.substr(0, ret.length - 6);
        case 3:
            return ret.substr(0, ret.length - 4);
        case 1:
            return ret.substr(0, ret.length - 2);
        default:
            return ret;
    }
};
//Converts a hex string into an array with numerical values
Convert.hexToArray = function(hex) {
    return hex.match(/[\dA-Fa-f]{2}/g).map(function(v) {
        return parseInt(v, 16);
    });
};

//Converts an array with bytes into a hex string
Convert.arrayToHex = function(array) {
    var hex = "";

    if (array instanceof ArrayBuffer) {
        return Convert.arrayToHex(new Uint8Array(array));
    }
    for (var i = 0; i < array.length; i++) {
        hex += ("0" + array[i].toString(16)).substr(-2);
    }
    return hex;
};

//Converts an unsigned 32 bit integer into a hexadecimal string. Padding is added as needed
Convert.int32toHex = function(i) {
    return ("00000000" + Math.floor(Math.abs(i)).toString(16)).substr(-8);
};

//TOTP implementation
var TOTP = {
    //Calculates the TOTP counter for a given point in time
    //time(number):      Time value (in seconds) to use. Usually the current time (Date.now()/1000)
    //interval(number):  Interval in seconds at which the key changes (usually 30).
    getOtpCounter: function(time, interval) {
        return (time / interval) | 0;
    },

    //Calculates the current counter for TOTP
    //interval(number): Interval in seconds at which the key changes (usually 30).
    getCurrentCounter: function(interval) {
        return TOTP.getOtpCounter(Date.now() / 1000 | 0, interval);
    },

    //Calculates a HOTP value
    //keyHex(string):      Secret key as hex string
    //counterInt(number):  Counter for the OTP. Use TOTP.getOtpCounter() to use this as TOTP instead of HOTP
    //size(number):        Number of digits (usually 6)
    //cb(function):        Callback(string)
    otp: function(keyHex, counterInt, size, cb) {
        var isInt = function(x) {
            return x === x | 0;
        };
        if (typeof(keyHex) !== typeof("")) {
            throw new Error("Invalid hex key");
        }
        if (typeof(counterInt) !== typeof(0) || !isInt(counterInt)) {
            throw new Error("Invalid counter value");
        }
        if (typeof(size) !== typeof(0) || (size < 6 || size > 10 || !isInt(size))) {
            throw new Error("Invalid size value (default is 6)");
        }

        //Calculate hmac from key and counter
        TOTP.hmac(keyHex, "00000000" + Convert.int32toHex(counterInt), function(mac) {
            //The last 4 bits determine the offset of the counter
            var offset = parseInt(mac.substr(-1), 16);
            //Extract counter as a 32 bit number anddiscard possible sign bit
            var code = parseInt(mac.substr(offset * 2, 8), 16) & 0x7FFFFFFF;
            //Trim and pad as needed
            (cb || console.log)(("0000000000" + (code % Math.pow(10, size))).substr(-size));
        });
    },
    //Calculates a SHA-1 hmac
    //keyHex(string):   Key for hmac as hex string
    //valueHex(string): Value to hash as hex string
    //cb(function):     Callback(string)
    hmac: function(keyHex, valueHex, cb) {
        var algo = {
            name: "HMAC",
            //SHA-1 is the standard for TOTP and HOTP
            hash: "SHA-1"
        };
        var modes = ["sign", "verify"];
        var key = Uint8Array.from(Convert.hexToArray(keyHex));
        var value = Uint8Array.from(Convert.hexToArray(valueHex));
        crypto.subtle.importKey("raw", key, algo, false, modes).then(function(cryptoKey) {
            console.debug("Key imported", keyHex);
            crypto.subtle.sign(algo, cryptoKey, value).then(function(v) {
                console.debug("HMAC calculated", value, Convert.arrayToHex(v));
                (cb || console.log)(Convert.arrayToHex(v));
            });
        });
    },
    //Checks if this browser is compatible with the TOTP implementation
    isCompatible: function() {
        var f = function(x) {
            return typeof(x) === typeof(f);
        };
        if (typeof(crypto) === typeof(TOTP) && typeof(Uint8Array) === typeof(f)) {
            return !!(crypto.subtle && f(crypto.subtle.importKey) && f(crypto.subtle.sign) && f(crypto.subtle.digest));
        }
        return false;
    }
}
//Make sure the conversion script is loaded first
if (typeof(Convert) !== typeof(TOTP)) {
    TOTP = null;
    alert("Data conversion module not loaded");
    throw new Error("Data conversion module not loaded");
}

function callback(otp) {
    api.info(otp);
    document.getElementById('code').value = otp;
    api.finish();
}

counter = TOTP.getOtpCounter(Date.now() / 1000, 30);

api.startAsyncSyntheticEvent();
token = api.getCredential("${creds}", "token");
TOTP.otp(Convert.base32toHex(token), counter, 6, callback);