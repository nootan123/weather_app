import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/constants/annimation_constant.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/font_size.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  final Function? reTry;
  final double? height, width;
  const ErrorScreen(
      {this.errorMessage = '', this.reTry, this.height, this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(errorAnnimation),
          const SizedBox(height: 12.0),
          Text("Oops!! $errorMessage",
              style: const TextStyle(fontSize: font_16, color: kLightBlack)),
          reTry != null ? const SizedBox(height: 12.0) : const SizedBox(),
          reTry != null
              ? FloatingActionButton(
                  onPressed: () => reTry!(),
                  child: const Icon(Icons.replay, size: 35))
              : const SizedBox()
        ],
      ),
    );
  }
}
