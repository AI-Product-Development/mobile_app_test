# API Design Specification

This document details the API structure for the backend prototype of the mobile application, implemented using Python, FastAPI, SQLModel, and SQLite, based on the provided Product Requirements Document, Architecture Guide, and Database Design.

## 1. API Overview

The backend API prototype serves as an intermediary between the Flutter mobile application and the n8n webhook. Its primary purpose is to receive keyword search requests from the mobile client, forward these requests to the configured n8n webhook, and return the processed viral video results and transcripts back to the client. The API is designed with a focus on simplicity and functionality for the initial prototype phase.

*   **OpenAPI/Swagger Documentation:** Once implemented, the interactive API documentation will be available at the `/docs` endpoint of the running FastAPI application.

## 2. Project Structure

A proposed directory structure for the FastAPI application:

```
.
├── main.py             # FastAPI application entry point
├── app/
│   ├── __init__.py
│   ├── core/           # Core application logic, settings, database setup
│   │   ├── __init__.py
│   │   ├── config.py   # Application settings
│   │   └── database.py # Database engine and session management (SQLite)
│   ├── models/         # SQLModel definitions (from Database Design)
│   │   └── __init__.py
│   ├── api/            # API routers and endpoints
│   │   ├── __init__.py
│   │   └── v1/         # API version 1
│   │       ├── __init__.py
│   │       ├── endpoints/ # Endpoint definitions
│   │       │   ├── __init__.py
│   │       │   └── search.py # Search endpoint
│   │       └── deps.py     # Dependency injection
│   ├── schemas/        # Pydantic models for request/response
│   │   └── __init__.py
│   └── services/       # Business logic and interactions (e.g., with n8n)
│       └── __init__.py
└── requirements.txt    # Project dependencies
```

SQLModel definitions will reside in the `app/models/` directory.

## 3. Core Dependencies

Key Python libraries required for the prototype:

*   `fastapi`: The web framework.
*   `pydantic`: For data validation and serialization.
*   `sqlmodel`: For interacting with the SQLite database and defining models.
*   `uvicorn`: An ASGI server to run the FastAPI application.
*   `aiosqlite`: An asynchronous driver for SQLite, necessary for using `async`/`await` with SQLite in FastAPI.
*   `requests` or `httpx`: For making HTTP requests to the n8n webhook.

## 4. Authentication & Authorization

Authentication and authorization are **not required** for the initial prototype based on the current functional requirements. All API endpoints will be publicly accessible.

If authentication were to be implemented in the future, an approach using OAuth2PasswordBearer with JWT tokens would be suitable with FastAPI's capabilities.

## 5. Pydantic & SQLModel Models

Pydantic models will be defined in the `app/schemas/` directory for API request and response validation and serialization. These models will align with the data structures expected by the frontend and received from the n8n webhook.

The SQLModel definitions provided by the Data Architect in `05_data_architect_Database_Design.md` will be used in the `app/models/` directory. These models define the database schema and can also be used as Pydantic models. Where the API input/output structure differs from the database model, separate Pydantic models will be defined in `app/schemas/` and mapped accordingly.

**Key Pydantic Models (Initial):**

*   `KeywordSearchRequest`:
    ```python
    from pydantic import BaseModel

    class KeywordSearchRequest(BaseModel):
        keywords: str
    ```
*   `VideoResult`: (Structure based on expected n8n output)
    ```python
    from pydantic import BaseModel
    from typing import Optional

    class VideoResult(BaseModel):
        title: str
        url: str
        thumbnail_url: Optional[str] = None
        transcript: Optional[str] = None # Assuming transcript is part of the initial result
    ```
*   `SearchResponse`:
    ```python
    from pydantic import BaseModel
    from typing import List

    class SearchResponse(BaseModel):
        results: List[VideoResult]
        # Potentially add status or message fields
    ```

## 6. API Endpoints

### Search API

*   `Method & Path`: `POST /api/v1/search`
*   `Description`: Receives keywords and triggers a search for viral videos via the n8n webhook.
*   `Request Body`: `KeywordSearchRequest`
*   `Response(s)`:
    *   `200 OK`: `SearchResponse` - Returns a list of viral video results and transcripts.
    *   `400 Bad Request`: If the request body is invalid.
    *   `500 Internal Server Error`: If an error occurs during processing or communication with n8n.
*   `Auth`: No

## 7. Error Handling Strategy

FastAPI's built-in error handling will be utilized for validation errors (e.g., returning 422 for invalid request bodies based on Pydantic models).

Custom exception handlers will be implemented for specific application errors, such as:

*   Handling errors when communicating with the n8n webhook (e.g., returning a 500 Internal Server Error with a specific error message).
*   Handling potential database errors (though less critical for the initial read-heavy prototype).

Standard HTTP status codes will be used to indicate the type of error.

## 8. Key Asynchronous Operations

The primary asynchronous operation will be the communication with the n8n webhook using an asynchronous HTTP client (`httpx` is recommended for use with FastAPI's `async`).

Database operations with SQLite using SQLModel are typically blocking. To maintain the benefits of FastAPI's async capabilities, especially if database interactions become more complex or frequent, using an async driver like `aiosqlite` with SQLModel is recommended. This allows database sessions to be managed asynchronously, preventing blocking of the event loop. The database setup in `app/core/database.py` should be configured to use `aiosqlite`.
