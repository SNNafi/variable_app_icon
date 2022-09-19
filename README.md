# variable_app_icon

A plugin to use multiple app icon on iOS.

If you don't know yet, you can use multiple app icon in an iOS app from 10.3. You can accomplish
this in your flutter app by using this plugin

# Getting Started

First, add `variable_app_icon` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  variable_app_icon: ^0.0.1
```

Don't forget to `flutter pub get`.

# Usage

## 1. Setting the app icons

Open your ios project i.e. __Runner__ in Xcode, then go to __Build Settings__ tab.
<img src="https://github.com/SNNafi/variable_app_icon/blob/main/pictures/Screenshot1.png?raw=true">
Now search icon, you will find __Assets Catalog Compiler Options__. Set __Include All App Icon
Assets__ to __Yes__.
<img src="https://github.com/SNNafi/variable_app_icon/blob/main/pictures/Screenshot2.png?raw=true">
Then add all the icons name to the __Alternate App Icon Sets__.
<img src="https://github.com/SNNafi/variable_app_icon/blob/main/pictures/Screenshot3.png?raw=true">
Congratulations, you have completed the hard work. Let's have some dart code.

## 2. From the flutter side

Call this method to set other app icon.

```dart
await VariableAppIcon.changeAppIcon(name); 
```

But, set empty string, if you want to set the primary icon again. Calling this method with primary
icon name, has no effect

```dart
await VariableAppIcon.changeAppIcon(""); // to set the app primary icon
```

You are done. Enjoy!

# Demo

https://user-images.githubusercontent.com/22527366/191091356-817b69f0-1a84-4620-87ae-5969d519b4eb.MP4

# Support the package (optional)

If you find this package useful, you can support it by giving it a star.

# Credits

This package is created by [Shahriar Nasim Nafi](https://github.com/SNNafi)