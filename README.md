# Spotlight Bottom Navigation Bar for Flutter

Adds a spotlight theme to your bottom navigation bar.

## Installing:

1. Add the dependency in your `pubspec.yaml` file.

```yaml  
dependencies:  
 spotlight_nav_bar: <latest version>
 ```  

2. Import the `spotlight_nav_bar` package.

```dart  
import 'package:spotlight_nav_bar/spotlight_nav_bar.dart';
```

## Usage

```dart
MaterialApp(
  title: 'SpotlightNavBar Example',
  theme: ThemeData.light(),
  darkTheme: ThemeData.dark(),
  themeMode: ThemeMode.system,
  home: SpotlightNavBar(
    items: [
      SpotlightItem(
        title: 'Home',
        screen: const Center(
          child: Text('Home'),
        ),
      ),
      SpotlightItem(
        title: 'Search',
        screen: const Center(
          child: Text('Search'),
        ),
        icon: Icons.search,
        spotlightColor: Colors.green,
      ),
      SpotlightItem(
        title: 'Profile',
        screen: const Center(
          child: Text('Profile'),
        ),
        icon: Icons.person,
        lampColor: Colors.red,
        spotlightColor: Colors.blue,
      ),
    ],
  ));
```

## Examples

<img src="https://github.com/user-attachments/assets/df185526-6265-439f-a821-dcfdebdc5b9f" alt="black_white" width="300">

<img src="https://github.com/user-attachments/assets/40b1ebbc-0540-4093-b2f4-084e68c0edf3" alt="blue_yellow" width="300">

