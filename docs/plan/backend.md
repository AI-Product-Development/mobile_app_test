# Backend Implementation and Testing Plan (FastAPI)

This plan outlines the steps to set up a simple FastAPI backend with a search endpoint that returns dummy data. This backend will be developed and tested independently before being integrated with the Flutter application.

**Phase 1: FastAPI Project Setup and Basic Endpoint**

-   [x] Create a new directory for the backend project (e.g., `viral_video_backend`).
-   [ ] Initialize a git repository in the backend directory.
-   [ ] Create a `.gitignore` file for Python projects.
-   [x] Create a Python virtual environment.
-   [x] Activate the virtual environment.
-   [x] Create a `pyproject.toml` file using `uv init`.
-   [x] Add `fastapi` and `uvicorn[standard]` as dependencies using `uv add`.
-   [x] Install the dependencies using `uv add`.
-   [x] Create the main application file (e.g., `main.py`).
-   [x] Define a basic FastAPI application instance.
-   [x] Implement a simple root endpoint (`GET /`) to verify the server is running.
-   [x] Add basic Python logging configuration.
-   [x] Add CORS middleware to the FastAPI application.

**Phase 2: Define Models and Search Endpoint with Dummy Data**

-   [ ] Create a directory for API schemas (e.g., `app/schemas`).
-   [ ] Define Pydantic models for the search request (e.g., `KeywordSearchRequest`) and the video result response (e.g., `VideoResult`, `SearchResponse`). These models should match the data structure expected by the Flutter frontend.
-   [ ] Create a directory for API endpoints (e.g., `app/api/v1/endpoints`).
-   [ ] Implement a `POST /api/v1/search` endpoint in a new file (e.g., `app/api/v1/endpoints/search.py`).
-   [ ] Include hardcoded dummy video result data within the backend code.
-   [ ] Implement the logic within the `/search` endpoint to return this hardcoded dummy data. The current MVP does not require filtering based on keywords, just returning the full dummy dataset.

**Phase 3: Standalone Backend Testing**

-   [ ] Run the FastAPI application locally using Uvicorn:
    ```bash
    uvicorn main:app --reload
    ```
    This command assumes that your main application file is named `main.py` and that the FastAPI application instance is named `app`. The `--reload` flag enables automatic reloading of the server when code changes are detected.
-   [ ] Provide detailed steps on how to test the `/` endpoint using a web browser or `curl`:
    -   **Using a web browser:** Open your web browser and navigate to `http://localhost:8000/` (or the port you specified with the `--port` option). You should see the message "Backend is running".
    -   **Using curl:** Open your terminal and run the following command:
        ```bash
        curl http://localhost:8000/
        ```
        You should see a JSON response like `{"message": "Backend is running"}`.

-   [ ] Test the `/api/v1/search` endpoint:
    -   **Using curl:** Open your terminal and run the following command, replacing `<keywords>` with your search terms:
        ```bash
        curl -X POST -H "Content-Type: application/json" -d '{"keywords": "<keywords>"}' http://localhost:8000/api/v1/search
        ```
        For example:
        ```bash
        curl -X POST -H "Content-Type: application/json" -d '{"keywords": "cats"}' http://localhost:8000/api/v1/search
        ```
        You should receive a JSON response containing a list of video results.

    -   **Using an API testing tool (e.g., Postman, Insomnia):**
        -   Create a new POST request to `http://localhost:8000/api/v1/search`.
        -   Set the `Content-Type` header to `application/json`.
        -   In the request body, provide a JSON payload with a `keywords` field (e.g., `{"keywords": "dogs"}`).
        -   Send the request and verify that you receive a JSON response containing a list of video results.

-   [ ] Document how to interpret the API responses, including status codes and the structure of the returned JSON data:
    -   **Status Code:** The API should return a 200 OK status code for successful requests.
    -   **Response Body:** The response body will be a JSON object with the following structure:
        ```json
        {
          "results": [
            {
              "title": "Video Title",
              "thumbnailUrl": "https://example.com/thumbs/video.jpg",
              "transcript": "Video transcript text."
            },
            ...
          ]
        }
        ```
        The `results` field is an array of video objects. Each video object contains the `title`, `thumbnailUrl`, and `transcript` fields.
