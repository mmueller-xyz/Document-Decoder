# Document Decoder
The decoder takes a Base64 stream on the path `0.0.0.0:50713/base64/<filename>`, decodes it and saves it at `/tmp/decoded-docs/filename`

build and run the container with `make all`

# Postman 
in order to integrate this into Postman add the following Javascript code into 'Tests' and make sure to replace `<filename>` with the desired filename
```javascript
pm.sendRequest({
    url: '127.0.0.1:50713/base64/<filename>',
    method : 'POST',
    body: {
        mode: "raw",
        raw: pm.response.json()["document"]
    }
})
```