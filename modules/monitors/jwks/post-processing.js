if (response.getStatusCode() !== 200) {
  api.fail("HTTP error: " + response.getStatusCode());
}

var responseBody = response.getResponseBody();
var jsonData = JSON.parse(responseBody);

if(!Array.isArray(jsonData.keys)) {
  api.fail("keys is not an array");
}

if(jsonData.keys.length === 0) {
  api.fail("no keys returned");
}
