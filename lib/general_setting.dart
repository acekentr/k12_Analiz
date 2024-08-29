import 'dart:io';
import 'package:flutter/material.dart';

var fontweight = Platform.isMacOS ? FontWeight.w300 : FontWeight.normal;

class GeneralSettings {
  static TextStyle loginPageStyle(Color color, double fontsize) {
    return TextStyle(
      fontSize: fontsize,
      color: color,
      fontWeight: fontweight,
    );
  }

  static TextStyle pdtStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 14,
      color: Colors.black,
    );
  }

  static TextStyle ddtextStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 14,
      color: Colors.black,
    );
  }

  static TextStyle tooltipStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 16,
      color: Colors.white,
    );
  }

  static TextStyle accordoniStyle({Color color = Colors.black, double fontsize = 16}) {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: fontsize,
      color: color,
    );
  }

  static TextStyle tabContainerTitleStyle({Color color = Colors.black, double fontsize = 18}) {
    return TextStyle(
      fontWeight: FontWeight.w600, // fontweight,
      fontSize: fontsize,
      color: color,
    );
  }

  static TextStyle toogleTextStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 16,
      //color: Colors.black,
    );
  }

  static TextStyle dualToogleStyle({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: Platform.isMacOS ? 12 : 14,
      color: color,
    );
  }

  static TextStyle easyloadingStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 16,
      color: Colors.white,
    );
  }

  static TextStyle aramaFormStyle(Color color) {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 12,
      color: color,
    );
  }

  static TextStyle ddInnerSearchStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 20,
      color: Colors.indigo,
    );
  }

  static TextStyle searchBoxStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 16,
      color: Colors.indigo,
    );
  }

  static TextStyle selectModalTitleStyle({Color color = Colors.deepOrange, double fontsize = 22}) {
    return TextStyle(
      fontSize: fontsize,
      color: color,
      fontWeight: fontweight,
    );
  }

  static TextStyle blackWithfontsizeStyle({double fontSize = 16}) {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  static TextStyle selectModalitemStyle({
    Color cDefault = Colors.black87,
    Color cChosen = Colors.indigo,
    double fontsize = 18,
    bool selected = false,
  }) {
    return TextStyle(
      fontSize: fontsize,
      color: selected ? cChosen : cDefault,
      fontWeight: fontweight,
    );
  }

  static TextStyle chatItemStyle({Color color = Colors.black, double fontsize = 15}) {
    return TextStyle(
      fontSize: fontsize,
      color: color,
      fontWeight: fontweight,
    );
  }

  static TextStyle baslikStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 25,
      color: Colors.white,
    );
  }

  static TextStyle baslikBlackStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 25,
      color: Colors.black,
    );
  }

  static TextStyle toggleButtonStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 18,
      color: Colors.black,
    );
  }

  static TextStyle textBlack20Style() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 20,
      color: Colors.black,
    );
  }

  static TextStyle textWhite20Style() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 20,
      color: Colors.white,
    );
  }

  static TextStyle textBlack16Style() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 16,
      color: Colors.black,
    );
  }

  static TextStyle bottomStyle(Color color) {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 12,
      color: color,
    );
  }

  static TextStyle convexAppbarStyle(Color color) {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 12,
      color: color,
    );
  }

  static TextStyle userStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 14,
      color: Colors.white,
    );
  }

  static TextStyle kayitBulunamadiStyle() {
    return TextStyle(
      fontWeight: fontweight,
      fontSize: 20,
      color: Colors.black,
    );
  }

  static TextStyle textFormFieldStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: fontweight,
      color: Colors.black,
    );
  }

  static TextStyle textLineThroughFormFieldStyle() {
    return TextStyle(
      decoration: TextDecoration.lineThrough,
      fontWeight: fontweight,
      color: Colors.black,
    );
  }

  static TextStyle formBaslikSize24Style() {
    return TextStyle(
      fontWeight: fontweight,
      color: Colors.red,
      fontSize: 24,
    );
  }

  static TextStyle formBaslikSize20Style() {
    return TextStyle(
      fontWeight: fontweight,
      color: Colors.red,
      fontSize: 20,
    );
  }

  static TextStyle formSubtitleStyle() {
    return TextStyle(
      fontWeight: fontweight,
      color: Colors.black,
      fontSize: 16,
    );
  }

  static TextStyle gfButtonTextStyle() {
    return TextStyle(
      fontWeight: fontweight,
      color: Colors.white,
      fontSize: 14,
    );
  }

  static TextStyle size20TextStyle({Color? color}) {
    return TextStyle(
      fontWeight: fontweight,
      color: color,
      fontSize: 20,
    );
  }

  static TextStyle size12TextStyle({Color? color}) {
    return TextStyle(
      fontWeight: fontweight,
      color: color,
      fontSize: 12,
    );
  }

  static TextStyle size10TextStyle({Color? color}) {
    return TextStyle(
      fontWeight: fontweight,
      color: color,
      fontSize: 10,
    );
  }
}
