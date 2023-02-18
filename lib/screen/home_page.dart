import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/font_size.dart';
import 'package:weatherapp/constants/font_weight.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 55.0, 24.0, 0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: const Text("Search Area"),
                ),
                const SizedBox(height: 209.0),
                const Text(
                  "Kathmandu",
                  style: TextStyle(
                      color: kLightBlack, fontSize: font_30, fontWeight: w6),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "20",
                  style: TextStyle(
                      color: kLightBlack, fontSize: font_36, fontWeight: w7),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
