
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Color color;
  var height = 60.0;
  void Function()? onPressed;
  Widget child;
  MyButton({
    super.key,
    required this.color,
    required this.height,
    required this.child,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      color: color,
      onPressed: onPressed,
      child: child,
    );
  }
}
