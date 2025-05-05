TITLE: Defining a simple FastAPI app - Python
DESCRIPTION: This is the simplest possible FastAPI application. It imports the FastAPI class, creates an application instance, and defines a GET path operation for the root URL ('/') that returns a JSON message.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/tutorial/first-steps.md#_snippet_0

LANGUAGE: python
CODE:
```
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello World"}
```

----------------------------------------

TITLE: Running FastAPI with Uvicorn Console
DESCRIPTION: This console command is used to start the FastAPI application locally using the Uvicorn server. It specifies the Python module (`main`), the FastAPI application instance within that module (`app`), and enables the `--reload` flag for automatic server restart upon code changes, which is useful during development.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/tutorial/first-steps.md#_snippet_0

LANGUAGE: console
CODE:
```
uvicorn main:app --reload

<span style="color: green;">INFO</span>:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
<span style="color: green;">INFO</span>:     Started reloader process [28720]
<span style="color: green;">INFO</span>:     Started server process [28722]
<span style="color: green;">INFO</span>:     Waiting for application startup.
<span style="color: green;">INFO</span>:     Application startup complete.
```

----------------------------------------

TITLE: Declaring Request Body Parameter (Python)
DESCRIPTION: Shows how to declare a parameter in a FastAPI path operation function with a type hint corresponding to a Pydantic model (`Item`). FastAPI recognizes this and expects a request body matching the model's structure, automatically handling parsing, validation, and providing the data as the parameter value.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/tutorial/body.md#_snippet_2

LANGUAGE: Python
CODE:
```
async def create_item(item: Item):
```

----------------------------------------

TITLE: Running FastAPI Development Server with CLI
DESCRIPTION: Starts the FastAPI server in development mode using the CLI command `fastapi dev main.py`. This command enables automatic code reloading and serves the application via Uvicorn, providing access URLs for the API and generated documentation (Swagger UI and ReDoc).
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/index.md#_snippet_2

LANGUAGE: console
CODE:
```
$ fastapi dev main.py

 ╭────────── FastAPI CLI - Development mode ───────────╮
 │                                                     │
 │  Serving at: http://127.0.0.1:8000                  │
 │                                                     │
 │  API docs: http://127.0.0.1:8000/docs               │
 │                                                     │
 │  Running in development mode, for production use:   │
 │                                                     │
 │  fastapi run                                        │
 │                                                     │
 ╰─────────────────────────────────────────────────────╯

INFO:     Will watch for changes in these directories: ['/home/user/code/awesomeapp']
INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
INFO:     Started reloader process [2248755] using WatchFiles
INFO:     Started server process [2248757]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```

----------------------------------------

TITLE: Implementing Token Header Dependency (Python 3.9+) - Python
DESCRIPTION: Shows how to define a reusable dependency function (`get_token_header`) in a separate module (`app/dependencies.py`) to extract a custom `X-Token` header using type hints with `Annotated` and `fastapi.Header`. This dependency can be applied to multiple path operations or routers.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/tutorial/bigger-applications.md#_snippet_1

LANGUAGE: Python
CODE:
```
from typing import Annotated

from fastapi import Header, Depends


async def get_token_header(x_token: Annotated[str, Header()]):
    return x_token
```

----------------------------------------

TITLE: Defining Basic Sync FastAPI Endpoints (Python)
DESCRIPTION: This snippet demonstrates how to create a basic FastAPI application instance and define synchronous route handlers using the `@app.get()` decorator. It shows handling a root path and a path with a parameter, returning JSON responses. It requires FastAPI installed and needs to be run with an ASGI server like Uvicorn.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/index.md#_snippet_0

LANGUAGE: Python
CODE:
```
from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
```

----------------------------------------

TITLE: Importing Depends Function - FastAPI Python
DESCRIPTION: This snippet shows the standard way to import the `Depends` function directly from the `fastapi` library. `Depends` is the primary tool for defining and managing dependencies in FastAPI applications.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/reference/dependencies.md#_snippet_0

LANGUAGE: python
CODE:
```
from fastapi import Depends
```

----------------------------------------

TITLE: Using Annotated for Type Hints with Metadata Python 3.9+
DESCRIPTION: Demonstrates using the `Annotated` type hint from the standard `typing` module (Python 3.9+) to add arbitrary metadata alongside a type hint (`str`). The actual type is the first parameter, and subsequent parameters are metadata ignored by Python but usable by tools like FastAPI.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/python-types.md#_snippet_24

LANGUAGE: Python
CODE:
```
from typing import Annotated

some_variable: Annotated[str, "some metadata"] = "a string"
```

----------------------------------------

TITLE: Running FastAPI Application with Uvicorn (Console)
DESCRIPTION: This command demonstrates how to start a FastAPI application using the uvicorn ASGI server from the terminal. The `main:app` argument specifies the Python module (`main`) and the FastAPI application instance (`app`). The `--reload` flag is typically used during development to automatically restart the server when code changes are detected.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/tutorial/index.md#_snippet_0

LANGUAGE: console
CODE:
```
uvicorn main:app --reload

<span style="color: green;">INFO</span>:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
<span style="color: green;">INFO</span>:     Started reloader process [28720]
<span style="color: green;">INFO</span>:     Started server process [28722]
<span style="color: green;">INFO</span>:     Waiting for application startup.
<span style="color: green;">INFO</span>:     Application startup complete.
```

----------------------------------------

TITLE: Defining Function Dependencies in FastAPI
DESCRIPTION: Shows a Python function intended to be used as a FastAPI dependency. It defines common query parameters and returns them as a dictionary.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/tutorial/dependencies/classes-as-dependencies.md#_snippet_0

LANGUAGE: Python
CODE:
```
def common_parameters(q: str | None = None, skip: int = 0, limit: int = 100):
    return {"q": q, "skip": skip, "limit": limit}
```

----------------------------------------

TITLE: Initializing Basic FastAPI App and Endpoints (Python)
DESCRIPTION: Defines a basic FastAPI application instance and sets up two synchronous GET endpoints: the root ('/') and an item endpoint ('/items/{item_id}'). It demonstrates path parameters ('item_id') and optional query parameters ('q').
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/index.md#_snippet_2

LANGUAGE: Python
CODE:
```
from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

```

----------------------------------------

TITLE: Installing Uvicorn Server (console)
DESCRIPTION: Provides the command-line instruction to install the Uvicorn ASGI server with standard dependencies. Uvicorn is commonly used to run FastAPI applications.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/index.md#_snippet_1

LANGUAGE: console
CODE:
```
pip install "uvicorn[standard]"

```

----------------------------------------

TITLE: Declaring Response Model via Return Type Annotation - FastAPI Python
DESCRIPTION: This snippet defines a Pydantic model `Item` and uses it directly as the function's return type annotation (`-> Item`) for a FastAPI path operation. FastAPI uses this annotation to validate, document, and filter the response data based on the `Item` model structure.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/tutorial/response-model.md#_snippet_0

LANGUAGE: Python
CODE:
```
from fastapi import FastAPI
from pydantic import BaseModel


class Item(BaseModel):
    name: str
    price: float
    tags: list[str] = []


app = FastAPI()


@app.get("/items/")
async def read_items() -> list[Item]:
    return [
        {"name": "Foo", "price": 42},
        {"name": "Bar", "price": "baz"},
    ]
```

----------------------------------------

TITLE: Defining Separate Input and Output Pydantic Models - FastAPI Python
DESCRIPTION: This snippet defines two distinct Pydantic models: `UserIn` for input (including the `password` field) and `UserOut` for output (excluding the `password` field). These models are used together with the `response_model` parameter in a path operation to show how to filter sensitive data from the response.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/tutorial/response-model.md#_snippet_4

LANGUAGE: Python
CODE:
```
from fastapi import FastAPI
from pydantic import BaseModel, EmailStr


class UserIn(BaseModel):
    username: str
    password: str
    email: EmailStr
    full_name: str | None = None


class UserOut(BaseModel):
    username: str
    email: EmailStr
    full_name: str | None = None


app = FastAPI()
```

----------------------------------------

TITLE: Initializing FastAPI Application and Route - Python
DESCRIPTION: This snippet shows the basic setup for a FastAPI application, including necessary imports and defining a simple route. This minimal application structure is required to generate an OpenAPI schema.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/how-to/extending-openapi.md#_snippet_0

LANGUAGE: python
CODE:
```
from fastapi import FastAPI, APIRouter
from fastapi.openapi.utils import get_openapi

app = FastAPI()

@app.get("/items/")
async def read_items():
    return [{"name": "Foo"}]
```

----------------------------------------

TITLE: Creating Basic FastAPI App (Async)
DESCRIPTION: This alternative Python snippet shows the same minimal FastAPI application but uses `async def` for the endpoint functions. This is suitable when your endpoint logic involves asynchronous operations (like awaiting database calls or external API requests). FastAPI handles running these async functions efficiently.
SOURCE: https://github.com/fastapi/fastapi/blob/master/README.md#_snippet_2

LANGUAGE: Python
CODE:
```
from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
```

----------------------------------------

TITLE: Installing FastAPI with Standard Dependencies
DESCRIPTION: This command installs FastAPI along with the standard dependencies required for building web APIs, including an ASGI server like Uvicorn and libraries for data validation like Pydantic. It's recommended to perform this installation within a Python virtual environment.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/index.md#_snippet_0

LANGUAGE: console
CODE:
```
pip install "fastapi[standard]"
```

----------------------------------------

TITLE: Validating FastAPI Token Data and Scopes with Pydantic (Python)
DESCRIPTION: Updates the `TokenData` Pydantic model to include a `scopes` field and shows how to extract and validate the token payload against this model within a dependency. This ensures the expected data structure (username and list of scopes) is present and valid.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/advanced/security/oauth2-scopes.md#_snippet_5

LANGUAGE: Python
CODE:
```
class TokenData(BaseModel):
    username: str | None = None
    scopes: list[str] = []

# ... inside dependency function ...
try:
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    username: str = payload.get("sub")
    scopes: list[str] = payload.get("scopes", [])
    token_data = schemas.TokenData(scopes=scopes, username=username)
except (JWTError, ValidationError):
    raise credentials_exception
user = fake_users_db.get(token_data.username)
if user is None:
    raise credentials_exception
```

----------------------------------------

TITLE: Defining and Using Basic Dependency in FastAPI
DESCRIPTION: This snippet shows how to define a simple dependency as a Python function and then use `fastapi.Depends` to inject its return value into a path operation function parameter. The dependency function itself can accept parameters like query or path parameters, which FastAPI will automatically resolve.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/tutorial/dependencies/index.md#_snippet_0

LANGUAGE: Python
CODE:
```
from typing import Annotated

from fastapi import Depends, FastAPI

# Define the dependency function. It behaves like a small path operation.
def common_parameters(q: str | None = None, skip: int = 0, limit: int = 100):
    return {"q": q, "skip": skip, "limit": limit}

app = FastAPI()

@app.get("/items/")
# Declare the dependency in a path operation function using Annotated and Depends
async def read_items(commons: Annotated[dict, Depends(common_parameters)]):
    # The result of common_parameters is available in the 'commons' parameter
    return commons
```

----------------------------------------

TITLE: Defining Basic Async FastAPI Endpoints (Python)
DESCRIPTION: This snippet provides an alternative to the synchronous example, illustrating how to define asynchronous route handlers using `async def` for GET requests in FastAPI. It covers handling a root path and a parameterized path, returning JSON responses. Using `async def` is recommended for handlers that involve asynchronous operations.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/index.md#_snippet_1

LANGUAGE: Python
CODE:
```
from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
```

----------------------------------------

TITLE: Installing FastAPI with Standard Dependencies
DESCRIPTION: This command installs FastAPI along with the standard dependencies required for building web APIs, including an ASGI server like Uvicorn and libraries for data validation like Pydantic. It's recommended to perform this installation within a Python virtual environment.
SOURCE: https://github.com/fastapi/fastapi/blob/master/README.md#_snippet_0

LANGUAGE: console
CODE:
```
pip install "fastapi[standard]"
```

----------------------------------------

TITLE: Creating Virtual Environment with venv Console
DESCRIPTION: This command uses the built-in `venv` module to create a new virtual environment. It runs `python` with the `-m` flag to execute the `venv` module as a script, specifying `.venv` as the directory name where the environment will be created.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/virtual-environments.md#_snippet_1

LANGUAGE: console
CODE:
```
$ python -m venv .venv
```

----------------------------------------

TITLE: Mixing Required, Default, and Optional Query Params (FastAPI, Python)
DESCRIPTION: Demonstrates combining required (`needy`), parameters with default values (`skip`), and optional parameters (`limit`) in a single FastAPI endpoint. This showcases FastAPI's ability to handle complex query parameter configurations based on type hints and default value assignments.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/fr/docs/tutorial/query-params.md#_snippet_5

LANGUAGE: Python
CODE:
```
from typing import Optional
from fastapi import FastAPI

app = FastAPI()

@app.get("/items/{item_id}")
async def read_item(item_id: str, needy: str, skip: int = 0, limit: Optional[int] = None):
    # Example logic - not specified in text, just demonstrate usage
    item = {"item_id": item_id, "needy": needy, "skip": skip}
    if limit is not None:
        item.update({"limit": limit})
    return item
```

----------------------------------------

TITLE: Declare Basic Path Parameter in FastAPI
DESCRIPTION: This Python code defines a simple GET endpoint with a path parameter `item_id`. FastAPI automatically captures the value from the URL path and passes it as an argument to the path operation function.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/tutorial/path-params.md#_snippet_0

LANGUAGE: Python
CODE:
```
from fastapi import FastAPI

app = FastAPI()


@app.get("/items/{item_id}")
async def read_item(item_id):
    return {"item_id": item_id}
```

----------------------------------------

TITLE: Building FastAPI Docker Image (Annotated) - Dockerfile
DESCRIPTION: Defines the Docker build process for a FastAPI application using a multi-file structure ('/app'), with step-by-step annotations explaining each instruction (FROM, WORKDIR, COPY, RUN, CMD) and the concept of Docker layer caching for optimization.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/deployment/docker.md#_snippet_3

LANGUAGE: Dockerfile
CODE:
```
FROM python:3.9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
```

----------------------------------------

TITLE: Defining Async Endpoints in FastAPI (Python)
DESCRIPTION: Presents an alternative implementation of the root and item endpoints using `async def` functions. This structure is necessary for endpoints that perform asynchronous operations (like database calls or external API requests) to avoid blocking the event loop.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/em/docs/index.md#_snippet_3

LANGUAGE: Python
CODE:
```
from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

```

----------------------------------------

TITLE: Add Query Parameter Validation with Annotated in FastAPI
DESCRIPTION: This snippet demonstrates how to use `Annotated` and `Query` to add validation (specifically `max_length`) to an optional query parameter `q`. The `Query` instance with validation parameters is included within `Annotated`, while the optional status is maintained by the function parameter's default value of `None`.
SOURCE: https://github.com/fastapi/fastapi/blob/master/docs/en/docs/tutorial/query-params-str-validations.md#_snippet_2

LANGUAGE: Python
CODE:
```
from typing import Annotated
from fastapi import FastAPI, Query

app = FastAPI()

@app.get("/items/")
async def read_items(q: Annotated[str | None, Query(max_length=50)] = None):
    if q:
        return {"q": q}
    return {"message": "Hello World"}
