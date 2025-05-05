TITLE: Dart API Support Query Example
DESCRIPTION: This code snippet demonstrates how to provide an API to query for feature support at runtime, enabling plugin clients to avoid hard-coding platform checks. This ensures that the app can detect and use features as they become available across different platforms or plugin versions. It enhances flexibility and avoids code changes when new features are added.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/ecosystem/contributing/README.md#2025-04-21_snippet_2

LANGUAGE: Dart
CODE:
```
"if (somePluginInstance.supportsDoingThing) {\n  somePluginInstance.doThing();\n}"
```

----------------------------------------

TITLE: Building Flutter in Profile Mode
DESCRIPTION: Commands for building Flutter in profile mode for Android and iOS. Profile mode is similar to release mode but enables performance profiling tools and tracing.
SOURCE: https://github.com/flutter/flutter/blob/master/engine/src/flutter/docs/Flutter's-modes.md#2025-04-21_snippet_2

LANGUAGE: bash
CODE:
```
sky/tools/gn --android --runtime-mode=profile
sky/tools/gn --ios --runtime-mode=profile
```

----------------------------------------

TITLE: Running Flutter Hello World Example
DESCRIPTION: Commands to navigate to the hello_world example directory and run the Flutter application. This assumes an emulator is running or a device is connected with USB debugging enabled.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/examples/Running-examples.md#2025-04-22_snippet_0

LANGUAGE: bash
CODE:
```
cd examples/hello_world
```

LANGUAGE: bash
CODE:
```
flutter run
```

----------------------------------------

TITLE: Running Gradle to List Projects in Flutter Android Build
DESCRIPTION: This command displays the project structure of a Flutter app that uses Gradle for building. It shows the root project and its subprojects, which typically include the main app and any plugins. This requires executing the \'gradlew\' script from the Android directory in the Flutter project.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/android/How-Flutter-apps-are-compiled-with-Gradle-for-Android.md#2025-04-21_snippet_0

LANGUAGE: Shell
CODE:
```
$ ./gradlew projects

> Task :projects

------------------------------------------------------------
Root project
------------------------------------------------------------

Root project 'android'
+--- Project ':app'
+--- Project ':bar'
+--- Project ':baz'
\--- Project ':foo'
```

----------------------------------------

TITLE: Running a Flutter App with Local Engine
DESCRIPTION: This snippet is used to run a Flutter application with a locally built engine, enabling developers to test and iterate without relying on pre-built engines. It can perform builds automatically if needed.
SOURCE: https://github.com/flutter/flutter/blob/master/engine/src/flutter/tools/engine_tool/README.md#2025-04-21_snippet_8

LANGUAGE: shell
CODE:
```
cd to/project/dir
et run
```

----------------------------------------

TITLE: Registering Platform View in AppDelegate for iOS Flutter App
DESCRIPTION: This snippet shows how to register the platform view in the AppDelegate of an iOS Flutter app. It initializes the view factory and registers it with the Flutter plugin registrar.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/Hybrid-Composition.md#2025-04-21_snippet_9

LANGUAGE: objc
CODE:
```
#import "AppDelegate.h"
#import "FLNativeView.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];

   NSObject<FlutterPluginRegistrar>* registrar =
      [self registrarForPlugin:@"plugin-name"];

  FLNativeViewFactory* factory =
      [[FLNativeViewFactory alloc] initWithMessenger:registrar.messenger];
  [[self registrarForPlugin:@"<plugin-name>"] registerViewFactory:factory
                                                          withId:@"<platform-view-type>"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
```

----------------------------------------

TITLE: Configuring Dependencies in pubspec.yaml
DESCRIPTION: Package dependencies configuration for integration testing in Flutter
SOURCE: https://github.com/flutter/flutter/blob/master/packages/integration_test/README.md#2025-04-21_snippet_0

LANGUAGE: yaml
CODE:
```
dev_dependencies:
  integration_test:
    sdk: flutter
  flutter_test:
    sdk: flutter
```

----------------------------------------

TITLE: Running iOS Integration Tests Locally
DESCRIPTION: This command demonstrates how to run the built iOS integration tests on a local device. It uses xcodebuild to execute the tests without rebuilding the app.
SOURCE: https://github.com/flutter/flutter/blob/master/packages/integration_test/README.md#2025-04-21_snippet_10

LANGUAGE: sh
CODE:
```
xcodebuild test-without-building \
  -xctestrun "build/ios_integ/Build/Products/Runner_*.xctestrun" \
  -destination id=<YOUR_DEVICE_ID>
```

----------------------------------------

TITLE: Running device lab tests with a local engine
DESCRIPTION: To run device lab tests with a locally built engine, use the `--local-engine-src-path`, `--local-engine`, and `--local-engine-host` flags. The `--local-engine-src-path` can be omitted if the local engine is in the same directory as the `flutter/` directory.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/contributing/testing/Running-and-writing-tests.md#2025-04-21_snippet_4

LANGUAGE: shell
CODE:
```
"../../bin/dart bin/run.dart \
  --local-engine-src-path=[path_to_src] \
  --local-engine=[engine_build_for_your_device] \
  --local-engine-host=[host_engine_build_for_your_device] \
  -t [task_name]"
```

LANGUAGE: shell
CODE:
```
"../../bin/dart bin/run.dart \
  --local-engine=[engine_build_for_your_device] \
  --local-engine-host=[host_engine_build_for_your_device] \
  -t [task_name]"
```

----------------------------------------

TITLE: Adding Executable Target
DESCRIPTION: This snippet defines the executable target with the name `${BINARY_NAME}` for a WIN32 application. It lists the source files that will be compiled into the executable, including Flutter-generated and application-specific source files.
SOURCE: https://github.com/flutter/flutter/blob/master/examples/api/windows/runner/CMakeLists.txt#2025-04-21_snippet_1

LANGUAGE: cmake
CODE:
```
add_executable(${BINARY_NAME} WIN32
  "flutter_window.cpp"
  "main.cpp"
  "utils.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
  "Runner.rc"
  "runner.exe.manifest"
)
```

----------------------------------------

TITLE: Building Flutter App Commands
DESCRIPTION: Common Flutter CLI commands for building and running the application across all platforms.
SOURCE: https://github.com/flutter/flutter/blob/master/examples/platform_channel/README.md#2025-04-21_snippet_0

LANGUAGE: bash
CODE:
```
flutter build
flutter run
```

----------------------------------------

TITLE: Running Integration Tests for Android and iOS in Flutter
DESCRIPTION: This command runs the integration test file 'example_test.dart' using Flutter's drive command for Android and iOS platforms. It specifies both the driver and target test files.
SOURCE: https://github.com/flutter/flutter/blob/master/packages/integration_test/example/README.md#2025-04-21_snippet_0

LANGUAGE: sh
CODE:
```
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/example_test.dart
```

----------------------------------------

TITLE: Starting Chromedriver for Web Integration Tests in Flutter
DESCRIPTION: This command starts Chromedriver on port 8444, which is necessary for running integration tests on the web platform. Chromedriver needs to be downloaded separately and run before executing the tests.
SOURCE: https://github.com/flutter/flutter/blob/master/packages/integration_test/example/README.md#2025-04-21_snippet_1

LANGUAGE: sh
CODE:
```
chromedriver --port 8444
```

----------------------------------------

TITLE: Adding Dependencies for Flutter Tool Build - CMake
DESCRIPTION: This snippet runs the Flutter tool's build portions, maintaining the necessary dependencies for proper Flutter application assembly. It is critical that this step is not removed to ensure the application builds correctly.
SOURCE: https://github.com/flutter/flutter/blob/master/dev/integration_tests/ui/windows/runner/CMakeLists.txt#2025-04-21_snippet_5

LANGUAGE: CMake
CODE:
```
# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)

```

----------------------------------------

TITLE: Flutter Library Package Dependencies Configuration in CMake
DESCRIPTION: Configures system-level dependencies for the Flutter Linux library using PkgConfig to find GTK, GLIB, and GIO packages which are required for Linux desktop integration.
SOURCE: https://github.com/flutter/flutter/blob/master/examples/platform_channel/linux/flutter/CMakeLists.txt#2025-04-21_snippet_1

LANGUAGE: CMake
CODE:
```
# System-level dependencies.
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK REQUIRED IMPORTED_TARGET gtk+-3.0)
pkg_check_modules(GLIB REQUIRED IMPORTED_TARGET glib-2.0)
pkg_check_modules(GIO REQUIRED IMPORTED_TARGET gio-2.0)
```

----------------------------------------

TITLE: Updating Build Tools Version in Android Gradle for Flutter App
DESCRIPTION: This snippet updates the Android SDK build tools and support libraries versions from 25 to 27 in the `android/app/build.gradle`, necessary for recent build environments in Flutter.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/android/Upgrading-Flutter-projects-to-Gradle-4.1-and-Android-Studio-Gradle-plugin-3.0.1.md#2025-04-21_snippet_4

LANGUAGE: Gradle
CODE:
```
In `android/app/build.gradle`, replace version `25` by `27` and `25.0.3` by `27.0.3` (three places total).
```

----------------------------------------

TITLE: Advanced MainActivity Java Method Channel Migration
DESCRIPTION: Demonstrates how to update custom platform channel handling to use the new Flutter embedding API with method channel registration
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/android/Upgrading-pre-1.12-Android-projects.md#2025-04-21_snippet_2

LANGUAGE: java
CODE:
```
-import io.flutter.app.FlutterActivity;
-import io.flutter.plugin.common.MethodCall;
+import androidx.annotation.NonNull;
+import io.flutter.embedding.android.FlutterActivity;
+import io.flutter.embedding.engine.FlutterEngine;
 import io.flutter.plugin.common.MethodChannel;
-import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
-import io.flutter.plugin.common.MethodChannel.Result;
+import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.dev/battery";

-    @Override
-    public void onCreate(Bundle savedInstanceState) {
-        super.onCreate(savedInstanceState);
-        GeneratedPluginRegistrant.registerWith(this);
-        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
-                new MethodCallHandler() {
-                    @Override
-                    public void onMethodCall(MethodCall call, Result result) {
-                        // Your existing code
-                    }
-                });
-    }
+    @Override
+    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
+        GeneratedPluginRegistrant.registerWith(flutterEngine);
+        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
+                .setMethodCallHandler(
+                    (call, result) -> {
+                        // Your existing code
+                }
+        );
+    }
}
```

----------------------------------------

TITLE: Migrating MainActivity Kotlin Code - Simple Case
DESCRIPTION: Updates MainActivity in Kotlin for the new Flutter Android embedding by removing manual plugin registration and updating import statements
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/android/Upgrading-pre-1.12-Android-projects.md#2025-04-21_snippet_1

LANGUAGE: kotlin
CODE:
```
// MainActivity.kt
-import android.os.Bundle
-import io.flutter.app.FlutterActivity
+import io.flutter.embedding.android.FlutterActivity
-import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
-  override fun onCreate(savedInstanceState: Bundle?) {
-    super.onCreate(savedInstanceState)
-    GeneratedPluginRegistrant.registerWith(this)
-  }
}
```

----------------------------------------

TITLE: Configuring Flutter App Wrapper Library
DESCRIPTION: Sets up the Flutter application wrapper library for the runner with core and app-specific source files. Configures compilation settings and dependencies.
SOURCE: https://github.com/flutter/flutter/blob/master/packages/flutter_tools/templates/app/windows.tmpl/flutter/CMakeLists.txt#2025-04-21_snippet_2

LANGUAGE: cmake
CODE:
```
add_library(flutter_wrapper_app STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_APP}
)
apply_standard_settings(flutter_wrapper_app)
target_link_libraries(flutter_wrapper_app PUBLIC flutter)
target_include_directories(flutter_wrapper_app PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_app flutter_assemble)
```

----------------------------------------

TITLE: Updating Gradle Build Configuration - Groovy
DESCRIPTION: These Gradle configuration updates involve changing the compile SDK version, target SDK version, and other references in build.gradle files to ensure compatibility with the new Android API version.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/android/Upgrading-Engine's-Android-API-version.md#2025-04-21_snippet_2

LANGUAGE: groovy
CODE:
```
    // Update references in the specified files
* `DEPS`: Change the version parameter under `flutter/android/sdk/all/${{platform}}` to the newly uploaded CIPD version tag, e.g. `'version': 'version:30r2'`
* `tools/javadoc/gen_javadoc.py`: Bump the reference to `android-XX` in `classpath` to the latest version.
* `tools/cipd/android_embedding_bundle/build.gradle`: Bump `compileSdkVersion XX` to the latest version.
* `shell/platform/android/test_runner/build.gradle`: Bump `compileSdkVersion XX` to the latest version.
* `shell/platform/android/AndroidManifest.xml`: Bump `android:targetSdkVersion=XX` to the latest version.
* `testing/android/native_activity/native_activity.gni`: Bump the reference to `build-tools/XX` in `android_buildtools` to the latest **build-tools** version and the reference to `android-XX` in `android_jar` to the latest version.
```

----------------------------------------

TITLE: Driver Script Implementation
DESCRIPTION: Basic driver script for running integration tests
SOURCE: https://github.com/flutter/flutter/blob/master/packages/integration_test/README.md#2025-04-21_snippet_2

LANGUAGE: dart
CODE:
```
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver();
```

----------------------------------------

TITLE: Building Using Host Debug Configuration
DESCRIPTION: This snippet outlines the command to build the Flutter engine using the default host debug configuration. It is useful for desktop platform development and requires a properly set up Flutter engine environment.
SOURCE: https://github.com/flutter/flutter/blob/master/engine/src/flutter/tools/engine_tool/README.md#2025-04-21_snippet_2

LANGUAGE: shell
CODE:
```
et build
et build --config host_debug
```

----------------------------------------

TITLE: Validating and Building Migrated Project
DESCRIPTION: Ensures that the migrated project can be built for both Android and iOS. Executing `flutter build apk` and `flutter build ios` will compile the application for respective platforms, confirming successful migration.
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/android/Upgrading-Flutter-projects-to-build-with-gradle.md#2025-04-21_snippet_4

LANGUAGE: shell
CODE:
```
cd <appname>
flutter build apk
flutter build ios
```

----------------------------------------

TITLE: Configuring Flutter Windows Application Build
DESCRIPTION: Defines the main executable target for a Flutter Windows application with necessary source files, build settings, and dependencies. Includes version definitions, Windows-specific configurations, and required library linkages.
SOURCE: https://github.com/flutter/flutter/blob/master/examples/hello_world/windows/runner/CMakeLists.txt#2025-04-21_snippet_0

LANGUAGE: cmake
CODE:
```
cmake_minimum_required(VERSION 3.14)
project(runner LANGUAGES CXX)

add_executable(${BINARY_NAME} WIN32
  "flutter_window.cpp"
  "main.cpp"
  "utils.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
  "Runner.rc"
  "runner.exe.manifest"
)

apply_standard_settings(${BINARY_NAME})

target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION=\"${FLUTTER_VERSION}\""
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MAJOR=${FLUTTER_VERSION_MAJOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MINOR=${FLUTTER_VERSION_MINOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_PATCH=${FLUTTER_VERSION_PATCH}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_BUILD=${FLUTTER_VERSION_BUILD}")

target_compile_definitions(${BINARY_NAME} PRIVATE "NOMINMAX")

target_link_libraries(${BINARY_NAME} PRIVATE flutter flutter_wrapper_app)
target_link_libraries(${BINARY_NAME} PRIVATE "dwmapi.lib")
target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")

add_dependencies(${BINARY_NAME} flutter_assemble)
```

----------------------------------------

TITLE: Configuring Application Target and Dependencies
DESCRIPTION: Sets up the main application target, including source files and dependencies. Links against Flutter and GTK libraries.
SOURCE: https://github.com/flutter/flutter/blob/master/examples/hello_world/linux/CMakeLists.txt#2025-04-21_snippet_3

LANGUAGE: cmake
CODE:
```
add_executable(${BINARY_NAME}
  "main.cc"
  "my_application.cc"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
)
apply_standard_settings(${BINARY_NAME})
target_link_libraries(${BINARY_NAME} PRIVATE flutter)
target_link_libraries(${BINARY_NAME} PRIVATE PkgConfig::GTK)
```

----------------------------------------

TITLE: Dart Platform View Link Implementation
DESCRIPTION: Create a PlatformViewLink for hybrid composition on Android, managing view registration and surface creation
SOURCE: https://github.com/flutter/flutter/blob/master/docs/platforms/Hybrid-Composition.md#2025-04-21_snippet_1

LANGUAGE: dart
CODE:
```
Widget build(BuildContext context) {
  final String viewType = 'hybrid-view-type';
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  return PlatformViewLink(
    viewType: viewType,
    surfaceFactory:
        (BuildContext context, PlatformViewController controller) {
      return AndroidViewSurface(
        controller: controller,
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
      );
    },
    onCreatePlatformView: (PlatformViewCreationParams params) {
      return PlatformViewsService.initSurfaceAndroidView(
        id: params.id,
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: StandardMessageCodec(),
      )
        ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
        ..create();
    },
  );
}
```

----------------------------------------

TITLE: Running Flutter Integration Tests
DESCRIPTION: This command runs Flutter integration tests. It requires a Flutter checkout and a working Android emulator or device. It uses the `flutter drive` command with `--local-engine-host` and `--local-engine` flags to specify the engine build.
SOURCE: https://github.com/flutter/flutter/blob/master/engine/src/flutter/shell/platform/android/README.md#_snippet_5

LANGUAGE: Shell
CODE:
```
cd $FLUTTER/dev/integration_tests/external_textures
flutter drive \
  --local-engine-host=$ENGINE/out/host_debug_unopt_arm64 \
  --local-engine=$ENGINE/out/android_debug_unopt_arm64
```

----------------------------------------

TITLE: Defining Standard Compilation Settings Function for Flutter Targets
DESCRIPTION: Creates a function that applies standard compilation settings to targets, including C++14 standard, warning flags, and optimization settings. This function centralizes common build configuration options.
SOURCE: https://github.com/flutter/flutter/blob/master/dev/integration_tests/ui/linux/CMakeLists.txt#2025-04-22_snippet_3

LANGUAGE: CMake
CODE:
```
# Compilation settings that should be applied to most targets.
#
# Be cautious about adding new options here, as plugins use this function by
# default. In most cases, you should add new options to specific targets instead
# of modifying this function.
function(APPLY_STANDARD_SETTINGS TARGET)
  target_compile_features(${TARGET} PUBLIC cxx_std_14)
  target_compile_options(${TARGET} PRIVATE -Wall -Werror)
  target_compile_options(${TARGET} PRIVATE "$<$<NOT:$<CONFIG:Debug>>:-O3>")
  target_compile_definitions(${TARGET} PRIVATE "$<$<NOT:$<CONFIG:Debug>>:NDEBUG>")
endfunction()
```

----------------------------------------

TITLE: Configuring Flutter Plugin Wrapper Library
DESCRIPTION: Creates and configures the Flutter wrapper library for plugins, including core implementations and plugin registrar sources with appropriate compilation settings.
SOURCE: https://github.com/flutter/flutter/blob/master/examples/hello_world/windows/flutter/CMakeLists.txt#2025-04-21_snippet_1

LANGUAGE: cmake
CODE:
```
add_library(flutter_wrapper_plugin STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_PLUGIN}
)
apply_standard_settings(flutter_wrapper_plugin)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  POSITION_INDEPENDENT_CODE ON)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_link_libraries(flutter_wrapper_plugin PUBLIC flutter)
target_include_directories(flutter_wrapper_plugin PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_plugin flutter_assemble)
```<environment_details>
# VSCode Visible Files
testing/docs/tech-guides/Flutter.md

# VSCode Open Tabs
session-notes/MCP-dev/initial notes.md
session-notes/MCP-dev/test.md
../../../Users/dabr/OneDrive - Tonkin + Taylor Group Ltd/Documents/Cline/MCP/context7-mcp/Dockerfile
../../../Users/dabr/AppData/Roaming/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
session-notes/MCP-dev/01-VSCode-local-setup.md
session-notes/MCP-dev/00-Session-Notes.md
session-notes/MCP-dev/04-MCP-Development-Guide.md
session-notes/MCP-dev/05-Sequential-Thinking-Setup.md
session-notes/MCP-dev/06-Brave-Search-Setup.md
session-notes/MCP-dev/07_Knowledge-Graph-Memory-Setup.md
session-notes/MCP-dev/08-Magic-UI-Setup.md
testing/docs/products/02_product_manager_PRD.md
testing/docs/products/03_UX_designer_UIDD.md
testing/docs/products/04_solution_architect_Architecture_Guide.md
testing/docs/products/05_data_architect_Database_Design.md
testing/docs/products/06_senior_api_developer_API_Design.md
testing/docs/products/07_planner_Plan.md
testing/docs/tech-guides/Flutter.md

# Current Time
4/27/2025, 4:39:08 PM (Pacific/Auckland, UTC+12:00)

# Context Window Usage
260,284 / 1,048.576K tokens used (25%)

# Current Mode
ACT MODE
</environment_details>
