# A very basic hello world express.js app for quick testing.

# Paths
```
{ method: "GET", uri: "/hello", params: ["name"] },
{ method: "POST", uri: "/welcome", params: ["name"] }
```

GET http://localhost:3000/ HTTP/1.1
content-type: application/json
{
    "name": "sample",
    "time": "Wed, 21 Oct 2015 18:27:50 GMT"
}

*TIP* https://github.com/Huachao/vscode-restclient