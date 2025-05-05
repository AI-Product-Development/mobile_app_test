# Testing and Debugging Instructions (Frontend MVP with Hardcoded Dummy Data)

This document provides detailed instructions for testing and debugging the Flutter frontend MVP, which uses hardcoded dummy data for search results and transcripts.

## 1. Running the Application

To run the application, navigate to the `viral_video_app` directory in your terminal and execute the following command:

```bash
flutter run
```

This will launch the application on an available emulator or connected device.

## 2. Testing Search Functionality

The application uses hardcoded dummy data for search results. The search filters based on keywords present in the video title or transcript.

- **To test successful searches:**
    - Enter keywords that are present in the dummy data titles or transcripts (e.g., "cats", "tech", "dogs", "Flutter").
    - Tap the "Search" button.
    - Verify that the list of video results is displayed correctly, showing only the videos that match the keywords.

- **To test searches with no results:**
    - Enter keywords that are not present in any of the dummy data titles or transcripts (e.g., "boats", "airplanes", "react").
    - Tap the "Search" button.
    - Verify that a "No results found for..." message is displayed.

- **To test empty search query:**
    - Leave the search bar empty.
    - Tap the "Search" button.
    - Verify that a "Please enter keywords to search." message is displayed.

## 3. Testing Video Detail Screen

- After performing a successful search, tap on a video title in the search results list.
- Verify that the application navigates to the Video Detail Screen.
- Verify that the correct video title is displayed in the AppBar.
- Verify that the transcript for the selected video is displayed in the body of the screen.
- If a video in the dummy data does not have a transcript, verify that "No transcript available." is displayed.
- Test the back navigation (using the device's back button or the back arrow in the AppBar) to ensure it returns to the Home Screen.

## 4. Debugging Tips

- **Check the console output:** When running `flutter run`, keep an eye on the console output for any errors or warnings.
- **Use Flutter DevTools:** Flutter DevTools provides a suite of debugging and performance tools. You can open DevTools from the console output when the app is running.
- **Set breakpoints:** Use your IDE's debugging features to set breakpoints in the Dart code (e.g., in `SearchProvider` or the UI widgets) to step through the code and inspect variable values.
- **Examine the widget tree:** DevTools allows you to inspect the widget tree, which can be helpful in understanding the layout and identifying UI issues.
- **Verify state changes:** When debugging state management issues, use DevTools or print statements to verify that the state properties in `SearchProvider` are being updated as expected.
