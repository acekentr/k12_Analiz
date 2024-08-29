import 'package:flutter/material.dart';
import 'package:k12_analiz/constants/app_theme.dart';
import 'package:pull_down_button/pull_down_button.dart';

class CustomFormDecoration {
  CustomFormDecoration._();

  static InputDecoration buildCustomFormDecoration({
    String label = "",
    EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(10, 0, 0, 5),
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      counterStyle: const TextStyle(fontSize: 0),
      helperText: '',
      filled: true,
      fillColor: AppTheme.textBoxFillColor,
      contentPadding: contentPadding,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.textBoxBorderFocusColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.borderErrorColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.borderErrorColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.textBoxBorderColor,
          //width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.textBoxBorderColor,
        ),
      ),
    );
  }

  static InputDecoration buildCustomDDFormDecoration({
    String label = "",
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      helperText: "",
      helperStyle: const TextStyle(fontSize: 0),
      errorStyle: const TextStyle(fontSize: 0),
      counterStyle: const TextStyle(fontSize: 0),
      filled: true,
      fillColor: AppTheme.textBoxFillColor,
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.textBoxBorderFocusColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.borderErrorColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.borderErrorColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.textBoxBorderColor,
          //width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: AppTheme.textBoxBorderColor,
        ),
      ),
    );
  }

  static pullDownMenuRouteTheme() {
    return const PullDownMenuRouteTheme(
      backgroundColor: AppTheme.pullDownButonBackGroundColor,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      shadow: BoxShadow(
        color: Colors.grey,
        offset: Offset(5.0, 5.0),
        blurRadius: 10,
      ),
    );
  }
}
