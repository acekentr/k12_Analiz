import 'package:flutter/material.dart';
import 'package:k12_analiz/constants/widget_style.dart';
import 'package:k12_analiz/general_setting.dart';

class FormLabelWidget extends StatelessWidget {
  final double width; // receives the value
  final double height; // receives the value
  final String label;

  const FormLabelWidget({
    super.key,
    required this.label,
    this.height = 36,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 0),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // color: Colors.grey.shade200,
      decoration: WidgetStyle.buildContainerBoxDecoration(),
      child: Text(
        label,
        style: GeneralSettings.textFormFieldStyle(),
        //Get.theme.textTheme.displaySmall,
      ),
    );
  }
}
