# Viral Video Search App (Frontend MVP)

This is the Frontend MVP of the Viral Video Search application, built with Flutter. This version uses hardcoded dummy data for search results and transcripts.

## Getting Started

1.  Navigate to the `viral_video_app` directory in your terminal.
2.  Ensure you have Flutter installed and set up.
3.  Run the application on an emulator or connected device using the command:
    ```bash
    flutter run
    ```

## How to Use

-   Enter keywords related to viral videos in the search bar on the home screen.
-   Tap the "Search" button to filter the hardcoded dummy data based on your keywords.
-   Matching video titles will appear in the list below the search bar.
-   Tap on a video title to view its transcript on the Video Detail Screen.

## Testing

This MVP uses hardcoded dummy data. You can test the search and navigation functionality:

-   **Search Testing:** Enter keywords like "cats", "tech", "dogs", or "Flutter" to see filtered results. Test with keywords not in the dummy data to see the "No results found" message. Test with an empty search bar to see the "Please enter keywords" message.
-   **Navigation Testing:** Tap on a video title in the search results to navigate to the detail screen and view the transcript.

For more detailed testing and debugging instructions, please refer to the [testing guide](/docs/plan/testing.md).

## Project Structure

```
viral_video_app/
├── lib/
│   ├── main.dart             # Application entry point and provider setup
│   ├── models/
│   │   └── video_result.dart   # Data model for video results
│   ├── providers/
│   │   └── search_provider.dart # State management for search functionality (with dummy data)
│   └── screens/
│       ├── home_screen.dart    # Home screen with search UI and results list
│       └── video_detail_screen.dart # Screen to display video transcript
├── pubspec.yaml              # Project dependencies
└── README.md                 # Project README
