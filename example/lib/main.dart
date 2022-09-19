import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:variable_app_icon/variable_app_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  String currentIcon = "AppIcon";
  List<String> appIcons = ["AppIcon", "AppIcon2", "AppIcon3"];

  @override
  void initState() {
    super.initState();
    loadCurrentIcon();
  }

  Future<void> loadCurrentIcon() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString("currentAppIcon") ?? currentIcon;
    print(name);
    setState(() {
      currentIcon = name;
    });
  }

  Future<void> changeIcon(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("currentAppIcon", value!);
    print(value);
    setState(() {
      currentIcon = value;
    });
    await VariableAppIcon.changeAppIcon(value == "AppIcon" ? "" : value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: DropdownButton<String>(
            value: currentIcon,
            items: appIcons
                .map((name) => DropdownMenuItem<String>(
                      child: Text(name),
                      value: name,
                    ))
                .toList(),
            onChanged: changeIcon,
          ),
        ),
      ),
    );
  }
}
