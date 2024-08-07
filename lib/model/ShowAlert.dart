import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  Widget title;
  Widget content;
  List<Widget>? actions;

  MyAlertBox({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}
