import 'package:flutter/material.dart';

class FormInputWidget extends StatelessWidget {
  final double width; // receives the value
  final double height; // receives the value
  final Widget inputWidget;

  const FormInputWidget({super.key, required this.inputWidget, this.height = 60, this.width = 545});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      height: height,
      child: inputWidget,
    );
  }
}
