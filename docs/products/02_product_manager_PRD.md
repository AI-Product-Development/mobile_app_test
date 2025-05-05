# Product Requirements Document

## Elevator Pitch

This mobile application empowers business users, particularly content creators, to stay ahead in their market by providing instant access to trending viral videos and their full transcripts based on user-defined keywords. Leveraging a powerful n8n backend for data processing, the app simplifies market research and content inspiration, delivering key insights directly to the user's device.

## Who is this app for

This app is intended for business users who are involved in content creation and need to understand the current trends and popular topics within their market. This includes marketers, social media managers, content strategists, and anyone who requires quick access to viral video content and transcripts for research and inspiration.

## Functional Requirements

*   Users shall be able to enter keywords related to their market or content interests.
*   The app shall send the entered keywords to a configured n8n webhook.
*   The app shall receive a list of viral videos and their transcripts from the n8n webhook.
*   The app shall display the list of viral videos, including relevant information such as title, thumbnail, and source.
*   Users shall be able to view the full transcript for each viral video.
*   The app shall handle and display errors gracefully if the webhook request fails or returns an error.
*   The app shall indicate to the user when data is being fetched from the backend.

## User Stories

*   As a content creator, I want to enter keywords related to my niche so that I can find trending video topics for inspiration.
*   As a marketer, I want to see a list of viral videos based on market keywords so that I can understand what content is currently resonating with the audience.
*   As a user, I want to view the transcript of a viral video so that I can quickly extract key information or quotes.
*   As a user, I want the app to show me when it's loading results so that I know the request is being processed.

## User Interface

The user interface should be clean, intuitive, and easy to navigate.

*   **Home Screen:** A prominent search bar for entering keywords. Below the search bar, a loading indicator will be displayed while fetching results.
*   **Search Results Screen:** A list view displaying the viral videos. Each list item should include the video title and a thumbnail. Tapping on a list item will navigate to the Video Detail Screen.
*   **Video Detail Screen:** Displays the video title, potentially an embedded video player (stretch goal, depends on platform support and n8n output), and the full transcript of the video.
*   **Error Handling:** Clear and user-friendly error messages should be displayed if something goes wrong during the search or data retrieval process.
*   **Visual Design:** A modern and professional look and feel, potentially incorporating the client's branding if available later.
