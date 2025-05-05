# Architecture Guide

This document outlines the technical architecture for the mobile application that provides access to viral videos and transcripts via an n8n backend, based on the Product Requirements Document and UX Design Document.

## 1. Selected Architecture Pattern

The chosen architecture pattern is **Client-Server with a Dedicated Backend API**.

This pattern was selected because it provides enhanced security by not directly exposing the n8n webhook to the mobile app, offers increased flexibility and scalability for handling complex logic and future features, and aligns well with the suggested technical stack for the backend. While initially more complex than direct webhook communication, it establishes a more robust foundation for a functional client application.

## 2. State Management

*   **Frontend State Management:** For the Flutter frontend, a suitable state management strategy would be using a provider package like `Provider`, `Riverpod`, or `Bloc`. These allow for managing application state efficiently and reacting to changes in data fetched from the backend. The choice between them can be made during the development phase based on project complexity and team preference.
*   **Backend State Management:** The backend API will be largely stateless in terms of handling individual client requests. State related to data (viral videos, transcripts) will be managed within the database. Synchronization between the backend and the n8n webhook will be handled through API calls from the backend to the webhook.

## 3. Technical Stack

*   **Frontend:**
    *   **Framework:** Flutter (for cross-platform mobile development).
    *   **UI Libraries:** Standard Flutter widgets will be used, potentially supplemented by a package like `cupertino_icons` or `material_icons` for iconography.
    *   **Component Strategy:** The UI will be built using a composition of Flutter widgets, following best practices for creating reusable and maintainable UI components based on the UIDD.
*   **Backend:**
    *   **Language/Framework:** Python with FastAPI. FastAPI is chosen for its high performance, ease of use, and automatic documentation generation.
    *   **Database (Initial Prototype):** SQLite. This provides a simple, file-based database suitable for the initial prototype phase.
    *   **ORM:** SQLModel. SQLModel is a library for interacting with SQL databases, designed to work well with FastAPI and Pydantic.
    *   **Caching layers:** Not required for the initial prototype, but could be added later if performance becomes a bottleneck (e.g., caching search results).
*   **Authentication:** Not required for the initial prototype based on the current requirements. If user accounts or saved searches are implemented later, an authentication provider like OAuth2, JWT, Clerk, or Firebase Auth would be considered.
*   **Payments:** Not applicable based on the current requirements.
*   **Key Integrations:**
    *   **n8n Webhook:** Integration with the n8n webhook for fetching viral video data and transcripts.

## 4. Authentication & Authorization Flow

Authentication and authorization are not part of the initial prototype's functional requirements. If implemented in the future for features like user accounts or saved data, the flow would typically involve:

*   **User Registration/Login:** Users would register with a username/email and password or use a third-party provider (e.g., Google, GitHub).
*   **Session Management:** Upon successful login, the backend would issue a token (e.g., JWT) to the client.
*   **Token Handling:** The client would store the token and include it in subsequent requests to the backend for authentication. The backend would validate the token.
*   **Authorization:** Role-based access control (RBAC) is not anticipated based on current requirements, but if different user roles were introduced, the backend would verify user permissions for specific actions.

## 5. High-Level Route Design

*   **Frontend Routes/Pages:**
    *   `/`: Home screen with search bar and results display.
    *   `/videoDetail/:videoId`: Video detail screen displaying transcript.
*   **Backend API Endpoint Categories:**
    *   `/api/v1/search`: Handles requests for searching viral videos based on keywords. This endpoint will communicate with the n8n webhook.
    *   `/api/v1/videos/{videoId}`: (Potential future endpoint) Retrieves details for a specific video if needed beyond the initial search results.

## 6. API Design Philosophy

The API will follow **RESTful** principles where appropriate, using standard HTTP methods (GET, POST) and status codes.

*   **Versioning:** API versioning will be implemented (e.g., `/api/v1`) to allow for future changes without breaking existing clients.
*   **Error Handling:** The API will return meaningful error responses with appropriate HTTP status codes (e.g., 400 for bad request, 500 for internal server error) and include informative error messages in the response body.

## 7. Database Design Overview

*   **Chosen Database Type (Initial Prototype):** SQLite.
*   **Key Data Models/Entities:** For the initial prototype, a database might not be strictly necessary if data is only fetched from n8n and not stored long-term. However, if features like saving search history or favorite videos are added, key entities would include:
    *   `User`: Stores user information (if authentication is implemented).
    *   `SearchQuery`: Stores user search queries.
    *   `Video`: Stores information about viral videos (if cached or saved).
    *   `Transcript`: Stores video transcripts (if cached or saved).

A detailed schema will be designed by the Data Architect using SQLModel if database persistence is required beyond the initial data fetching from n8n.

## 8. Deployment & Infrastructure Overview

*   **Target Hosting Environment:** For the initial prototype, the Flutter app can be run on mobile emulators or physical devices. The FastAPI backend and n8n instance would need to be hosted. Options could include a cloud provider like AWS, Azure, or a platform like Heroku or DigitalOcean for the backend, and a self-hosted or cloud-provided n8n instance.
*   **CI/CD Approach:** A basic CI/CD pipeline would involve automated testing and deployment upon code changes. Tools like GitHub Actions, GitLab CI, or Jenkins could be used.
