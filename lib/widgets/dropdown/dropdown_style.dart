import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:k12_analiz/general_setting.dart';

class DropdownStyle {
  static InputDecoration dropdownSearchDataStyle() {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      hintText: 'Arama...',
      hintStyle: GeneralSettings.aramaFormStyle(Colors.indigo),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.indigo,
        ),
      ),
    );
  }

  static ButtonStyleData buttonStyleData() {
    return const ButtonStyleData(
      height: 60,
      padding: EdgeInsets.only(left: 5, right: 5),
      elevation: 24,
    );
  }

  static IconStyleData iconStyleData() {
    return const IconStyleData(
      icon: Icon(
        Icons.arrow_forward_ios_outlined,
      ),
      iconSize: 14,
      iconEnabledColor: Colors.grey,
      iconDisabledColor: Colors.grey,
    );
  }

  static DropdownStyleData dropdownStyleData({double width = 300}) {
    return DropdownStyleData(
      maxHeight: 300,
      width: width,
      padding: null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      elevation: 8,
      offset: const Offset(0, 0),
      scrollbarTheme: ScrollbarThemeData(
        radius: const Radius.circular(40),
        thickness: MaterialStateProperty.all<double>(6),
        thumbVisibility: MaterialStateProperty.all<bool>(true),
      ),
    );
  }

  static MenuItemStyleData menuItemStyleData() {
    return const MenuItemStyleData(
      height: 40,
      padding: EdgeInsets.only(left: 14, right: 14),
    );
  }
}
