TITLE: Basic HTTPX Usage Example in Python
DESCRIPTION: Demonstrates basic HTTP GET request using HTTPX, including response handling and accessing response properties like status code, headers and content.
SOURCE: https://github.com/encode/httpx/blob/master/docs/index.md#2025-04-08_snippet_1

LANGUAGE: python
CODE:
```
>>> import httpx
>>> r = httpx.get('https://www.example.org/')
>>> r
<Response [200 OK]>
>>> r.status_code
200
>>> r.headers['content-type']
'text/html; charset=UTF-8'
>>> r.text
'<!doctype html>\n<html>\n<head>\n<title>Example Domain</title>...'
```

----------------------------------------

TITLE: Basic Client Usage with Context Manager
DESCRIPTION: Shows how to properly use an HTTPX Client instance with a context manager for automatic connection cleanup.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/clients.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
with httpx.Client() as client:
    ...
```

----------------------------------------

TITLE: Response Content Handling in HTTPX
DESCRIPTION: Examples of handling response content, including text decoding, binary content, and JSON parsing.
SOURCE: https://github.com/encode/httpx/blob/master/docs/quickstart.md#2025-04-08_snippet_2

LANGUAGE: python
CODE:
```
>>> r = httpx.get('https://www.example.org/')
>>> r.text
>>> r.encoding
>>> r.content
>>> from PIL import Image
>>> from io import BytesIO
>>> i = Image.open(BytesIO(r.content))
```

----------------------------------------

TITLE: Making Basic Async Request with AsyncClient
DESCRIPTION: Example showing how to make a basic asynchronous GET request using HTTPX's AsyncClient within an async context manager.
SOURCE: https://github.com/encode/httpx/blob/master/docs/async.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
>>> async with httpx.AsyncClient() as client:
...     r = await client.get('https://www.example.com/')
...
>>> r
<Response [200 OK]>
```

----------------------------------------

TITLE: Configuring Client-Level Basic Authentication in HTTPX
DESCRIPTION: Shows how to configure basic authentication at the client level so all requests automatically include credentials.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/authentication.md#2025-04-08_snippet_1

LANGUAGE: python
CODE:
```
>>> auth = httpx.BasicAuth(username="username", password="secret")
>>> client = httpx.Client(auth=auth)
>>> response = client.get("https://www.example.com/")
```

----------------------------------------

TITLE: Handling HTTPStatusError Exceptions in HTTPX
DESCRIPTION: Shows how to handle HTTPStatusError exceptions in HTTPX, which are raised for non-2xx status codes. The example demonstrates accessing both request and response information from the exception.
SOURCE: https://github.com/encode/httpx/blob/master/docs/quickstart.md#2025-04-08_snippet_14

LANGUAGE: python
CODE:
```
response = httpx.get("https://www.example.com/")
try:
    response.raise_for_status()
except httpx.HTTPStatusError as exc:
    print(f"Error response {exc.response.status_code} while requesting {exc.request.url!r}.")
```

----------------------------------------

TITLE: Basic HTTP Requests with HTTPX
DESCRIPTION: Shows how to import HTTPX and make basic GET, POST, PUT, DELETE, HEAD, and OPTIONS requests.
SOURCE: https://github.com/encode/httpx/blob/master/docs/quickstart.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
>>> import httpx
>>> r = httpx.get('https://httpbin.org/get')
>>> r = httpx.post('https://httpbin.org/post', data={'key': 'value'})
>>> r = httpx.put('https://httpbin.org/put', data={'key': 'value'})
>>> r = httpx.delete('https://httpbin.org/delete')
>>> r = httpx.head('https://httpbin.org/get')
>>> r = httpx.options('https://httpbin.org/get')
```

----------------------------------------

TITLE: Configuring Fine-Grained Timeout Settings in HTTPX
DESCRIPTION: Demonstrates how to set up granular timeout configurations using the Timeout class, showing how to specify different timeout values for different operations like connecting versus other operations.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/timeouts.md#2025-04-08_snippet_3

LANGUAGE: python
CODE:
```
# A client with a 60s timeout for connecting, and a 10s timeout elsewhere.
timeout = httpx.Timeout(10.0, connect=60.0)
client = httpx.Client(timeout=timeout)

response = client.get('http://example.com/')
```

----------------------------------------

TITLE: Basic HTTPX Logging Setup
DESCRIPTION: Demonstrates basic logging configuration for HTTPX using Python's logging module. Sets up debug level logging with a custom format that includes timestamp, level, logger name and message.
SOURCE: https://github.com/encode/httpx/blob/master/docs/logging.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
import logging
import httpx

logging.basicConfig(
    format="%(levelname)s [%(asctime)s] %(name)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
    level=logging.DEBUG
)

httpx.get("https://www.example.com")
```

----------------------------------------

TITLE: Setting Up Basic HTTP Proxy in HTTPX
DESCRIPTION: Configures an HTTPX Client to route all traffic (HTTP and HTTPS) through a proxy server located at http://localhost:8030.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/proxies.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
with httpx.Client(proxy="http://localhost:8030") as client:
    ...
```

----------------------------------------

TITLE: Basic usage of HTTPX in Python
DESCRIPTION: Shows a basic example of using HTTPX to make a GET request and inspect the response. It demonstrates how to send a request, check the status code, and access response headers and content.
SOURCE: https://github.com/encode/httpx/blob/master/README.md#2025-04-08_snippet_1

LANGUAGE: python
CODE:
```
>>> import httpx
>>> r = httpx.get('https://www.example.org/')
>>> r
<Response [200 OK]>
>>> r.status_code
200
>>> r.headers['content-type']
'text/html; charset=UTF-8'
>>> r.text
'<!doctype html>\n<html>\n<head>\n<title>Example Domain</title>...'
```

----------------------------------------

TITLE: Configuring Client-Side Certificates in HTTPX
DESCRIPTION: Demonstrates how to set up client-side certificates for authentication to remote servers using HTTPX and the SSL context load_cert_chain method.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/ssl.md#2025-04-08_snippet_5

LANGUAGE: python
CODE:
```
ctx = ssl.create_default_context()
ctx.load_cert_chain(certfile="path/to/client.pem")  # Optionally also keyfile or password.
client = httpx.Client(verify=ctx)
```

----------------------------------------

TITLE: Implementing Logging with HTTPX Event Hooks in Python
DESCRIPTION: Demonstrates how to create basic request and response logging hooks in HTTPX. The example defines two functions: one that logs when a request is about to be sent, and another that logs when a response is received, including the status code.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/event-hooks.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
def log_request(request):
    print(f"Request event hook: {request.method} {request.url} - Waiting for response")

def log_response(response):
    request = response.request
    print(f"Response event hook: {request.method} {request.url} - Status {response.status_code}")

client = httpx.Client(event_hooks={'request': [log_request], 'response': [log_response]})
```

----------------------------------------

TITLE: Creating Client Instances in HTTPX
DESCRIPTION: Shows the equivalent of creating a Requests Session in HTTPX, which is done using the Client class. This is used for maintaining session state and configurations across multiple requests.
SOURCE: https://github.com/encode/httpx/blob/master/docs/compatibility.md#2025-04-08_snippet_1

LANGUAGE: python
CODE:
```
session = requests.Session(**kwargs)
```

LANGUAGE: python
CODE:
```
client = httpx.Client(**kwargs)
```

----------------------------------------

TITLE: File Upload and Form Data with HTTPX
DESCRIPTION: Shows how to upload files and send form data using multipart encoding and JSON data.
SOURCE: https://github.com/encode/httpx/blob/master/docs/quickstart.md#2025-04-08_snippet_3

LANGUAGE: python
CODE:
```
>>> with open('report.xls', 'rb') as report_file:
...     files = {'upload-file': report_file}
...     r = httpx.post("https://httpbin.org/post", files=files)

>>> data = {'integer': 123, 'boolean': True, 'list': ['a', 'b', 'c']}
>>> r = httpx.post("https://httpbin.org/post", json=data)
```

----------------------------------------

TITLE: Client-Level Configuration
DESCRIPTION: Demonstrates setting client-level configuration that applies to all requests.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/clients.md#2025-04-08_snippet_4

LANGUAGE: python
CODE:
```
>>> url = 'http://httpbin.org/headers'
>>> headers = {'user-agent': 'my-app/0.0.1'}
>>> with httpx.Client(headers=headers) as client:
...     r = client.get(url)
...
>>> r.json()['headers']['User-Agent']
'my-app/0.0.1'
```

----------------------------------------

TITLE: Streaming Responses with HTTPX
DESCRIPTION: Demonstrates how to handle streaming responses for large downloads, including binary, text, and line-by-line streaming.
SOURCE: https://github.com/encode/httpx/blob/master/docs/quickstart.md#2025-04-08_snippet_4

LANGUAGE: python
CODE:
```
>>> with httpx.stream("GET", "https://www.example.com") as r:
...     for data in r.iter_bytes():
...         print(data)

>>> with httpx.stream("GET", "https://www.example.com") as r:
...     for text in r.iter_text():
...         print(text)
```

----------------------------------------

TITLE: Creating and Using a URL Object in Python
DESCRIPTION: Shows how to create an HTTPX URL object and access its properties. This example demonstrates the URL class's ability to handle normalized, IDNA-supporting URLs and access specific components like the host.
SOURCE: https://github.com/encode/httpx/blob/master/docs/api.md#2025-04-08_snippet_1

LANGUAGE: python
CODE:
```
>>> url = URL("https://example.org/")
>>> url.host
'example.org'
```

----------------------------------------

TITLE: Constructing and Sending an HTTP Request in Python
DESCRIPTION: Demonstrates how to create an HTTPX Request object with specific parameters and send it using a client. This example shows the flexibility of constructing requests explicitly for more control over the request details.
SOURCE: https://github.com/encode/httpx/blob/master/docs/api.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
>>> request = httpx.Request("GET", "https://example.org", headers={'host': 'example.org'})
>>> response = client.send(request)
```

----------------------------------------

TITLE: Using HTTPX Cookies Class for Domain-Specific Cookies
DESCRIPTION: Demonstrates the usage of the HTTPX Cookies class to set domain-specific cookies. It shows how to create a Cookies instance, set cookies for different domains, and use them in a request.
SOURCE: https://github.com/encode/httpx/blob/master/docs/quickstart.md#2025-04-08_snippet_7

LANGUAGE: python
CODE:
```
>>> cookies = httpx.Cookies()
>>> cookies.set('cookie_on_domain', 'hello, there!', domain='httpbin.org')
>>> cookies.set('cookie_off_domain', 'nope.', domain='example.org')
>>> r = httpx.get('http://httpbin.org/cookies', cookies=cookies)
>>> r.json()
{'cookies': {'cookie_on_domain': 'hello, there!'}}
```

----------------------------------------

TITLE: Token Refresh Authentication Implementation
DESCRIPTION: Custom authentication implementation that handles token refresh flows with response body access.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/authentication.md#2025-04-08_snippet_9

LANGUAGE: python
CODE:
```
class MyCustomAuth(httpx.Auth):
    requires_response_body = True

    def __init__(self, access_token, refresh_token, refresh_url):
        self.access_token = access_token
        self.refresh_token = refresh_token
        self.refresh_url = refresh_url

    def auth_flow(self, request):
        request.headers["X-Authentication"] = self.access_token
        response = yield request

        if response.status_code == 401:
            # If the server issues a 401 response, then issue a request to
            # refresh tokens, and resend the request.
            refresh_response = yield self.build_refresh_request()
            self.update_tokens(refresh_response)

            request.headers["X-Authentication"] = self.access_token
            yield request

    def build_refresh_request(self):
        # Return an `httpx.Request` for refreshing tokens.
        ...

    def update_tokens(self, response):
        # Update the `.access_token` and `.refresh_token` tokens
        # based on a refresh response.
        data = response.json()
        ...
```

----------------------------------------

TITLE: Using HTTP/2 AsyncClient with Context Manager
DESCRIPTION: Demonstrates how to use HTTPX AsyncClient with HTTP/2 support in a context manager pattern, ensuring proper connection cleanup.
SOURCE: https://github.com/encode/httpx/blob/master/docs/http2.md#2025-04-08_snippet_2

LANGUAGE: python
CODE:
```
async with httpx.AsyncClient(http2=True) as client:
    ...
```

----------------------------------------

TITLE: Implementing Per-Request Basic Authentication in HTTPX
DESCRIPTION: Demonstrates how to apply basic authentication for a single HTTP request using HTTPX client. Uses BasicAuth class with username and password credentials.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/authentication.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
>>> auth = httpx.BasicAuth(username="username", password="secret")
>>> client = httpx.Client()
>>> response = client.get("https://www.example.com/", auth=auth)
```

----------------------------------------

TITLE: Creating HTTPS Redirect Transport in Python for HTTPX
DESCRIPTION: This example demonstrates how to implement a custom transport that always redirects HTTP requests to HTTPS, and how to use it with HTTPX's Mounts feature.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/transports.md#2025-04-08_snippet_7

LANGUAGE: python
CODE:
```
class HTTPSRedirect(httpx.BaseTransport):
    """
    A transport that always redirects to HTTPS.
    """
    def handle_request(self, request):
        url = request.url.copy_with(scheme="https")
        return httpx.Response(303, headers={"Location": str(url)})

# A client where any `http` requests are always redirected to `https`
transport = httpx.Mounts({
    'http://': HTTPSRedirect()
    'https://': httpx.HTTPTransport()
})
client = httpx.Client(transport=transport)
```

----------------------------------------

TITLE: Installing HTTPX using pip
DESCRIPTION: Demonstrates how to install HTTPX using pip. This is the basic installation command for HTTPX.
SOURCE: https://github.com/encode/httpx/blob/master/README.md#2025-04-08_snippet_0

LANGUAGE: shell
CODE:
```
$ pip install httpx
```

----------------------------------------

TITLE: Setting HTTP Proxy and Making Requests in Python with HTTPX
DESCRIPTION: This snippet demonstrates how to set an HTTP proxy using an environment variable and make requests with HTTPX. It shows both a request that uses the proxy and one that bypasses it by setting trust_env=False.
SOURCE: https://github.com/encode/httpx/blob/master/docs/environment_variables.md#2025-04-08_snippet_0

LANGUAGE: bash
CODE:
```
export HTTP_PROXY=http://my-external-proxy.com:1234

# This request will be sent through the proxy
python -c "import httpx; httpx.get('http://example.com')"

# This request will be sent directly, as we set `trust_env=False`
python -c "import httpx; httpx.get('http://example.com', trust_env=False)"
```

----------------------------------------

TITLE: Using AsyncClient with Context Manager
DESCRIPTION: Shows how to properly initialize and use an AsyncClient with a context manager for automatic resource cleanup.
SOURCE: https://github.com/encode/httpx/blob/master/docs/async.md#2025-04-08_snippet_1

LANGUAGE: python
CODE:
```
async with httpx.AsyncClient() as client:
    ...
```

----------------------------------------

TITLE: Download Progress Monitoring with Rich
DESCRIPTION: Example of monitoring download progress using Rich progress bar library.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/clients.md#2025-04-08_snippet_7

LANGUAGE: python
CODE:
```
import tempfile
import httpx
import rich.progress

with tempfile.NamedTemporaryFile() as download_file:
    url = "https://speed.hetzner.de/100MB.bin"
    with httpx.stream("GET", url) as response:
        total = int(response.headers["Content-Length"])

        with rich.progress.Progress(
            "[progress.percentage]{task.percentage:>3.0f}%",
            rich.progress.BarColumn(bar_width=None),
            rich.progress.DownloadColumn(),
            rich.progress.TransferSpeedColumn(),
        ) as progress:
            download_task = progress.add_task("Download", total=total)
            for chunk in response.iter_bytes():
                download_file.write(chunk)
                progress.update(download_task, completed=response.num_bytes_downloaded)
```

----------------------------------------

TITLE: Setting Individual Request Timeouts in HTTPX
DESCRIPTION: Demonstrates how to set timeouts for individual HTTP requests using both the top-level API and client instance approaches. Shows setting a specific timeout value of 10.0 seconds.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/timeouts.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
# Using the top-level API:
httpx.get('http://example.com/api/v1/example', timeout=10.0)

# Using a client instance:
with httpx.Client() as client:
    client.get("http://example.com/api/v1/example", timeout=10.0)
```

----------------------------------------

TITLE: Using Default Encoding in HTTPX (Python)
DESCRIPTION: This snippet demonstrates the default behavior of HTTPX for text decoding. It shows how to instantiate a client, make a request, and access the response encoding and text.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/text-encodings.md#2025-04-08_snippet_0

LANGUAGE: python
CODE:
```
import httpx
# Instantiate a client with the default configuration.
client = httpx.Client()
# Using the client...
response = client.get(...)
print(response.encoding)  # This will either print the charset given in
                          # the Content-Type charset, or else "utf-8".
print(response.text)  # The text will either be decoded with the Content-Type
                      # charset, or using "utf-8".
```

----------------------------------------

TITLE: Configuring Multiple Proxies for HTTP and HTTPS in HTTPX
DESCRIPTION: Sets up an HTTPX Client with different proxy servers for HTTP and HTTPS traffic using the mounts dictionary, with HTTP requests routed through port 8030 and HTTPS through port 8031.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/proxies.md#2025-04-08_snippet_1

LANGUAGE: python
CODE:
```
proxy_mounts = {
    "http://": httpx.HTTPTransport(proxy="http://localhost:8030"),
    "https://": httpx.HTTPTransport(proxy="http://localhost:8031"),
}

with httpx.Client(mounts=proxy_mounts) as client:
    ...
```

----------------------------------------

TITLE: Uploading Text Content with HTTPX
DESCRIPTION: Shows how to upload plain text content as a file using HTTPX. Demonstrates setting a custom MIME type and handling content without a filename.
SOURCE: https://github.com/encode/httpx/blob/master/docs/advanced/clients.md#2025-04-08_snippet_10

LANGUAGE: python
CODE:
```
>>> files = {'upload-file': (None, 'text content', 'text/plain')}
>>> r = httpx.post("https://httpbin.org/post", files=files)
>>> print(r.text)
{
  ...
  "files": {},
  "form": {
    "upload-file": "text-content"
  },
  ...
}
