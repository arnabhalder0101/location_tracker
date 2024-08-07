import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Animationtest extends StatelessWidget {
  const Animationtest({super.key});
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(height: 190, r'lib\asset\walking.json');
  }
}
