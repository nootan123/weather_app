import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/constants/annimation_constant.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(loadingAnnimation);
  }
}
