# Database Design

This document outlines the relational database schema design for the initial prototype of the mobile application, focusing on implementation with Python, SQLModel, and SQLite, with consideration for future compatibility with Node.js and Prisma.

## 1. Database Design Summary

The database schema is designed to support potential future features such as saving user search history and associating transcripts with videos. For the initial prototype using SQLite and SQLModel, the design prioritizes simplicity and a clear representation of the core entities: Users, Search Queries, Videos, and Transcripts, along with the relationships between them.

## 2. Key Entities and Relationships

*   **User:** Represents a user of the application.
    *   Purpose: To uniquely identify users if features requiring user accounts are implemented.
*   **SearchQuery:** Represents a specific search performed by a user.
    *   Purpose: To store the keywords and timestamp of each search.
    *   Relationship: A User can have many Search Queries (One-to-Many: User to SearchQuery).
*   **Video:** Represents a viral video found through a search.
    *   Purpose: To store essential information about a video.
*   **Transcript:** Represents the textual content of a video's transcript.
    *   Purpose: To store the full transcript associated with a video.
    *   Relationship: A Video has one Transcript (One-to-One: Video to Transcript).
*   **SearchQueryResult:** A linking entity to connect Search Queries to the Videos returned by that search.
    *   Purpose: To represent the results of a specific search.
    *   Relationship: A Search Query can have many Videos, and a Video can be part of many Search Results (Many-to-Many: SearchQuery to Video, implemented via SearchQueryResult).

## 3. ER Diagram (Mermaid)

# Entity Relationship Diagram

```mermaid
erDiagram
    User ||--o{ SearchQuery : has
    SearchQuery ||--o{ SearchQueryResult : includes
    Video ||--o{ SearchQueryResult : is_included_in
    Video ||--o| Transcript : has

    User {
        id
        username
        email
    }

    SearchQuery {
        id
        query_text
        timestamp
        user_id
    }

    Video {
        id
        title
        url
        thumbnail_url
    }

    Transcript {
        id
        content
        video_id
    }

    SearchQueryResult {
        search_query_id
        video_id
    }


## 4. SQLModel Schema (Python/SQLite)

```python
from typing import List, Optional
from datetime import datetime
from sqlmodel import Field, SQLModel, Relationship

class SearchQueryResultLink(SQLModel, table=True):
    search_query_id: Optional[int] = Field(
        default=None, foreign_key="searchquery.id", primary_key=True
    )
    video_id: Optional[int] = Field(
        default=None, foreign_key="video.id", primary_key=True
    )

class User(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    username: str = Field(index=True, unique=True)
    email: Optional[str] = Field(default=None, index=True, unique=True)

    search_queries: List["SearchQuery"] = Relationship(back_populates="user")

class SearchQuery(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    query_text: str
    timestamp: datetime = Field(default_factory=datetime.utcnow)

    user_id: Optional[int] = Field(default=None, foreign_key="user.id")
    user: Optional[User] = Relationship(back_populates="search_queries")

    videos: List["Video"] = Relationship(back_populates="search_queries", link_model=SearchQueryResultLink)

class Transcript(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    content: str

    video_id: Optional[int] = Field(default=None, foreign_key="video.id", unique=True)
    video: "Video" = Relationship(back_populates="transcript")

class Video(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    title: str
    url: str = Field(index=True, unique=True)
    thumbnail_url: Optional[str] = Field(default=None)

    transcript: Optional[Transcript] = Relationship(back_populates="video")
    search_queries: List["SearchQuery"] = Relationship(back_populates="videos", link_model=SearchQueryResultLink)

```

## 5. Prisma Schema (Node.js - Secondary)

```prisma
// This is a simplified Prisma schema based on the SQLModel design.
// Adjustments might be needed based on specific Prisma features and conventions.

datasource db {
  provider = "sqlite" // Or other database for production
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id            Int           @id @default(autoincrement())
  username      String        @unique
  email         String?       @unique
  searchQueries SearchQuery[]
}

model SearchQuery {
  id       Int      @id @default(autoincrement())
  queryText String
  timestamp DateTime @default(now())
  userId    Int?

  user   User?   @relation(fields: [userId], references: [id])
  videos Video[] @relation("SearchQueryToVideo")
}

model Video {
  id           Int          @id @default(autoincrement())
  title        String
  url          String       @unique
  thumbnailUrl String?
  transcript   Transcript?
  searchQueries SearchQuery[] @relation("SearchQueryToVideo")
}

model Transcript {
  id      Int     @id @default(autoincrement())
  content String
  videoId Int     @unique
  video   Video   @relation(fields: [videoId], references: [id])
}
```

## 6. Design Rationale & Assumptions

*   **Initial Prototype Scope:** The schema is designed to be simple and support the core data entities identified for potential future features. It assumes that for the initial prototype, data fetching from n8n is the primary focus, and persistent storage of search results, videos, or transcripts might be limited or not fully implemented.
*   **SQLite/SQLModel Focus:** The primary schema representation is in SQLModel, tailored for SQLite. SQLite is suitable for a prototype due to its file-based nature and ease of setup.
*   **Prisma Compatibility:** A secondary Prisma schema is provided, demonstrating how the same conceptual model could be represented for a Node.js backend. Minor differences in syntax and relationship representation are noted.
*   **Relationships:** Standard relational patterns (One-to-Many, One-to-One, Many-to-Many) are used to define connections between entities.
*   **Indexing:** Basic indexing is applied to fields commonly used in queries (e.g., `username`, `email`, `url`) to improve performance, which is generally beneficial even in SQLite.
*   **Data Types:** Standard SQLModel and Prisma data types are used, compatible with SQLite.
*   **Future Scaling:** While designed for a prototype, the relational structure provides a foundation that can be migrated to more robust databases (e.g., PostgreSQL, MySQL) if the application scales and requires more advanced features or higher performance. The Prisma schema also facilitates potential migration to different database providers in a Node.js environment.
