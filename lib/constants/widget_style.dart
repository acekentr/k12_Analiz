import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k12_analiz/constants/app_theme.dart';
import 'package:k12_analiz/general_setting.dart';

class WidgetStyle {
  //Uygulamada kullanılacak olan yazılar

  WidgetStyle._();

  static InputDecoration buildInputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(
        bottom: 30 / 2,
        left: 5,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.indigo,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(0.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
  }

  static InputDecoration buildTextInputDecoration() {
    return InputDecoration(
      //counterText: '',
      counterStyle: const TextStyle(fontSize: 0),
      helperText: '',
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

  static InputDecoration buildTextInputDecorationNoAltField({String? hintText}) {
    return InputDecoration(
      //counterText: '',
      //counterStyle: const TextStyle(fontSize: 0),
      // helperText: '',
      //filled: true,
      //fillColor: AppDesktopTheme.textBoxFillColor,
      //contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 5),

      hintText: hintText ?? "",
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
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(0.0),
      //   borderSide: const BorderSide(
      //     color: AppDesktopTheme.textBoxBorderColor,
      //     //width: 1.0,
      //   ),
      // ),
      // disabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(0.0),
      //   borderSide: const BorderSide(
      //     color: AppDesktopTheme.textBoxBorderColor,
      //   ),
      // ),
    );
  }

  static InputDecoration buildTextInputDecoration2() {
    return InputDecoration(
      counterStyle: const TextStyle(fontSize: 0),
      filled: true,
      fillColor: AppTheme.textBoxFillColor,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
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

  static InputDecoration buildTextInputLabelDecoration(String labetText) {
    return InputDecoration(
      counterText: '',
      counterStyle: const TextStyle(fontSize: 0),
      helperText: '',
      labelText: labetText,
      labelStyle: const TextStyle(fontSize: 12, color: Colors.black26),

      //   errorStyle: TextStyle(height: 0),
      filled: true,
      fillColor: AppTheme.textBoxFillColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      border: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(5.0),
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
          width: 1.0,
        ),
      ),
    );
  }

  static InputDecoration buildPhoneInputDecoration() {
    return buildTextInputDecoration().copyWith(hintText: "*** *** ** **");
    // an itibariyle kullanılan diğer sayfalarda da kontrol ettim
    // input formatter ile eşdeğer şekilde gitmesi lazım, 12 değil 13 karakter uzunluğunda
  }

  static InputDecoration buildPhoneInputDecorationText() {
    return buildTextInputDecoration().copyWith(hintText: "Telefon Numaranız");
  }

  static BoxDecoration buildContainerBoxDecoration({
    bool rightBorder = false,
    Color bgColor = Colors.grey,
  }) {
    return BoxDecoration(
      color: bgColor == Colors.grey ? Colors.grey.shade200 : Colors.white,
      border: Border(
        left: BorderSide(color: Colors.grey.shade300),
        bottom: BorderSide(color: Colors.grey.shade300),
        top: BorderSide(color: Colors.grey.shade300),
        right: rightBorder == true
            ? BorderSide(
                color: Colors.grey.shade300,
              )
            : BorderSide.none,
      ),
    );
  }

  static InputDecoration buildSearcInputDecoration({String hintText = "Arama"}) {
    return InputDecoration(
      prefixIcon: const Icon(Icons.search),
      contentPadding: const EdgeInsets.only(bottom: 30 / 2, left: 5),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.indigo, width: 1.0),
        borderRadius: BorderRadius.circular(0.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(0.0),
      ),
      hintText: hintText,
      hintStyle: GeneralSettings.pdtStyle(),
    );
  }

  static InputDecoration buildDropDownDecoration({String hintText = "Seçiniz"}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GeneralSettings.ddtextStyle(),
      counterStyle: const TextStyle(fontSize: 0),
      helperText: '',
      filled: true,
      fillColor: AppTheme.textBoxFillColor,
      contentPadding: const EdgeInsets.only(bottom: 15, left: 5),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.indigo),
        borderRadius: BorderRadius.circular(0.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(0.0),
      ),
    );

    // return InputDecoration(
    //   //counterText: '',
    //   counterStyle: const TextStyle(fontSize: 0),
    //   helperText: '',
    //   filled: true,
    //   fillColor: AppDesktopTheme.textBoxFillColor,
    //   contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(0.0),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(0.0),
    //     borderSide: const BorderSide(
    //       color: AppDesktopTheme.textBoxBorderFocusColor,
    //     ),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(0.0),
    //     borderSide: const BorderSide(
    //       color: AppDesktopTheme.textBoxBorderErrorColor,
    //     ),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(0.0),
    //     borderSide: const BorderSide(
    //       color: AppDesktopTheme.textBoxBorderErrorColor,
    //     ),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(0.0),
    //     borderSide: const BorderSide(
    //       color: AppDesktopTheme.textBoxBorderColor,
    //       //width: 1.0,
    //     ),
    //   ),
    //   disabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(0.0),
    //     borderSide: const BorderSide(
    //       color: AppDesktopTheme.textBoxBorderColor,
    //     ),
    //   ),
    // );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '*');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
