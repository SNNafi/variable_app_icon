# variable_app_icon

A plugin to use multiple app icon on Android and iOS.

If you don't know yet, you can use multiple app icon in an iOS app from 10.3. in android, you can do this using `activity-alias`. You can accomplish
this in your flutter app by using this plugin

# Getting Started

First, add `variable_app_icon` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  variable_app_icon: ^0.0.1
```

Don't forget to `flutter pub get`.

# Usage

# 1. Setting the app icons (Android)

Drop you app icons in mipmap folders. Then in `AndroidManifest.xml` for each icon use like this,

```xml
<!-- Use this for each icon -->
<activity-alias
    android:name="appicon.DEFAULT" <!-- here is your icon id, this can be anything but keep at least one dot -->
    android:enabled="true" <!-- set true for default icon, for others' set false-->
    android:exported="true"
    android:icon="@mipmap/ic_launcher" <!-- icon location-->
    android:label="variable_app_icon_example"
    android:targetActivity=".MainActivity"> <!-- main activity -->
<intent-filter>
<action android:name="android.intent.action.MAIN" />
<category android:name="android.intent.category.LAUNCHER" />
</intent-filter>
    </activity-alias>
```

Remove label, icon attribute from the `application` tag.

Remove `<category android:name="android.intent.category.LAUNCHER" />` from the main activity's `<intent-filter>`.


## 2. Setting the app icons (iOS)

Open your ios project i.e. __Runner__ in Xcode, then go to __Build Settings__ tab.
<img src="https://github.com/SNNafi/variable_app_icon/blob/main/pictures/Screenshot1.png?raw=true">
Now search icon, you will find __Assets Catalog Compiler Options__. Set __Include All App Icon
Assets__ to __Yes__.
<img src="https://github.com/SNNafi/variable_app_icon/blob/main/pictures/Screenshot2.png?raw=true">
Then add all the icons name to the __Alternate App Icon Sets__.
<img src="https://github.com/SNNafi/variable_app_icon/blob/main/pictures/Screenshot3.png?raw=true">

## 3. From the flutter side

In `main` function set this two variable,

```dart
VariableAppIcon.iOSDefaultAppIcon = iosAppIcons[0]; // default ios icon
VariableAppIcon.androidAppIconIds = androidIconIds; // all android icons ids, this is the android:name, you have specified in `AndroidManifest.xml` file. like, ["appicon.DEFAULT", others]
```

Call this method to change app icon.

```dart
 await VariableAppIcon.changeAppIcon(
androidIconId: "appicon.TEAL",
iosIcon: "AppIcon2);
```

See the example app for complete example.

You are done. Enjoy!

# Demo

## Android

https://user-images.githubusercontent.com/22527366/191311548-c46fac40-e39f-4286-88c5-05fd6765b5e9.mp4

## iOS

https://user-images.githubusercontent.com/22527366/191091356-817b69f0-1a84-4620-87ae-5969d519b4eb.MP4

# Support the package (optional)

If you find this package useful, you can support it by giving it a star.

# Credits

This package is created by [Shahriar Nasim Nafi](https://github.com/SNNafi)