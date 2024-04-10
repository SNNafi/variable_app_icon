import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:variable_app_icon/variable_app_icon.dart';

const List<String> iosAppIcons = ["AppIcon", "AppIcon2", "AppIcon3"];

const List<String> androidIconIds = [
  "appicon.DEFAULT",
  "appicon.TEAL",
  "appicon.ORANGE"
];

void main() {
  VariableAppIcon.iOSDefaultAppIcon = iosAppIcons[0];
  VariableAppIcon.androidAppIconIds = androidIconIds;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIconIndex = 0;

  @override
  void initState() {
    super.initState();
    loadCurrentIcon();
  }

  Future<void> loadCurrentIcon() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt("currentIconIndex") ?? currentIconIndex;
    setState(() {
      currentIconIndex = index;
    });
  }

  Future<void> changeIcon(int? value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("currentIconIndex", value!);
    print(value);
    setState(() {
      currentIconIndex = value;
    });
    await VariableAppIcon.changeAppIcon(
        androidIconId: androidIconIds[currentIconIndex],
        iosIcon: iosAppIcons[currentIconIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin Example App'),
        ),
        body: Center(
          child: DropdownButton<int>(
            value: currentIconIndex,
            items: [0, 1, 2]
                .map((index) => DropdownMenuItem<int>(
              value: index,
              child: Text(Platform.isAndroid
                  ? androidIconIds[index]
                  : iosAppIcons[index]),
            ))
                .toList(),
            onChanged: changeIcon,
          ),
        ),
      ),
    );
  }
}

