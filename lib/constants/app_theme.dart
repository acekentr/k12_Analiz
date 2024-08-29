import 'package:flutter/material.dart';
import 'package:k12_analiz/general_setting.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFffffff);

  static const Color greenColor = Colors.green;
  static const Color yeniEkleButton = Colors.indigo;
  static const Color redColor = Colors.red;
  static const Color silButtonColor = Colors.red;

  static const Color iptalButtonColor = Color(0xFF9e9e9e);
  static const Color textBoxFillColor = Colors.white;
  static const Color textBoxBorderColor = Color(0xFFE0e0e0);
  static const Color textBoxBorderFocusColor = Colors.orange;
  static const Color borderErrorColor = Colors.red;
  static const Color headerBackgroundColor = Color(0xFFF7F7F7);
  static const Color headerLineColor = Color(0xFFd6d6d5);
  static const Color indigoColor = Colors.indigo;
  static const Color blueColor = Colors.blue;
  static const Color orangeColor = Colors.orange;
  static const Color greyColor = Colors.grey;
  static const Color whiteColor = Colors.white;
  static const Color amberColor = Colors.amber;
  static const Color coralColor = Color(0xFFFF7F50);
  static const Color purpleColor = Colors.purple;
  static const Color brownColor = Colors.brown;
  static const Color yellowColor = Colors.yellow;
  static const Color blackColor = Colors.black;
  static const Color lightSlateGreyColor = Color(0xFF778899);
  static const Color pullDownButonBackGroundColor = Color(0xFFEEEEEE); //grey.shade200
  static const Color formBackgroundColor = Color(0xFFFFFFFF);
  static const Color formTitleColor = Colors.black;
  static const Color successWigdetBackGroundColor = Color(0xFFC8E6C9);
  static const Color attentionWigdetBackGroundColor = Color(0xFFFFF3E0);
  static const Color errorWigdetBackGroundColor = Color(0xFFFFEBEE);
  static const Color drawerBottomColor = Color(0xFF3a0647);
  static const Color drawerTopColor = Color(0xFF092464);

  static const double pTableLeftSpace = 10; //pagination data table üst bilgi satırı sol boşluk
  static const double pTableRightSpace = 15; ////pagination data table üst bilgi satırı sol boşluk
  static const double pTableFormHorizantalSpace = 12; ////pagination data table üst bilgi satırı sol boşluk
  static const double pTableViewHorizantalSpace = 15; ////pagination data table üst bilgi satırı sol boşluk

  // Matrix renk kodları

  static final ThemeData coreTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    canvasColor: Colors.white, // Dropdown color için gerekli

    primaryColor: Colors.indigo,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.indigo,
      onPrimary: Colors.indigo.shade100,
      secondary: Colors.orange,
      onSecondary: Colors.orange.shade100,
      error: Colors.red,
      onError: Colors.red.shade100,
      background: Colors.white,
      onBackground: Colors.white12,
      surface: Colors.white,
      onSurface: Colors.grey.shade600,
      // loğin giriş ekranındaki kullanıcı adı şifre text rengi onSurface: Colors.white,
    ),

    //colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),

    dialogTheme: const DialogTheme(
      surfaceTintColor: AppTheme.appBackgroundColor,
      backgroundColor: AppTheme.appBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    ),

    //iconTheme: IconThemeData(
    //   color: Colors.pink,
    // ),

// back button gibi yapısal kısımlarda düzenleme yapıyor, daha sonra kullanılabilir
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    ),
    dataTableTheme: DataTableThemeData(
      dataRowColor: const WidgetStatePropertyAll(Colors.white),
      headingRowColor: const WidgetStatePropertyAll(Colors.white),
      dataTextStyle: GeneralSettings.pdtStyle(),
    ),

    visualDensity: const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),

// TODO: bunda sanki düzenleme yapmak lazım - çok hoş olmadı
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.deepOrangeAccent),
      fillColor: WidgetStatePropertyAll(Colors.white),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      mouseCursor: WidgetStateMouseCursor.clickable,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      shape: RoundedRectangleBorder(),
      side: BorderSide(),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      prefixIconColor: Colors.indigo,
      suffixIconColor: Colors.indigo,
      hoverColor: Colors.indigo.shade100,
      outlineBorder: BorderSide.none,

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),

      // --------- normal durumda
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
        // borderSide: const BorderSide(
        //   color: Colors.black,
        //   width: 1,
        // ),
      ),

      // --------- hata durumunda
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),

      // --------- tıklandığında
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(
          color: Colors.indigo,
          width: 1,
        ),
      ),

      // --------- tıklandığında
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(
          color: Colors.indigo,
          width: 1.5,
        ),
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.indigo,
      selectionColor: Colors.indigo.shade200,
    ),

    dividerTheme: DividerThemeData(
      color: Colors.grey.shade300,
      // form içerisindeki genel kullanım bu şekilde diye eklendi
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Colors.white,
    ),
  );

  //----------------------- login sayfası theme

  // static final LoginTheme loginTheme = LoginTheme(
  //   primaryColor: Colors.indigo,
  //   pageColorLight: AppTheme.drawerTopColor,
  //   pageColorDark: AppTheme.drawerBottomColor,
  //   accentColor: Colors.orange,
  //   textFieldStyle: GeneralSettings.loginPageStyle(Colors.grey.shade600, 14),
  //   bodyStyle: GeneralSettings.loginPageStyle(Colors.grey.shade600, 14),
  //   titleStyle: GeneralSettings.loginPageStyle(Colors.white, 16),
  //   buttonStyle: GeneralSettings.loginPageStyle(Colors.white, 16),
  //   buttonTheme: const LoginButtonTheme(
  //     backgroundColor: Colors.indigo,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(15),
  //       ),
  //     ),
  //   ),
  //   cardTheme: const CardTheme(
  //     color: Colors.white,
  //     surfaceTintColor: Colors.white, // bi azıcık renk veriyor
  //   ),
  //   inputTheme: InputDecorationTheme(
  //     contentPadding: const EdgeInsets.only(left: 40),
  //     filled: true,
  //     fillColor: Colors.grey.shade300,
  //     labelStyle: GeneralSettings.loginPageStyle(Colors.black, 20),

  //     hoverColor: Colors.indigo.shade100,
  //     // ne olur ne olmaz diye eklendi aslında diğer theme burayı eziyor

  //     // --------- normal durumda
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(15),
  //       borderSide: const BorderSide(
  //         color: Colors.black,
  //         width: 1,
  //       ),
  //     ),

  //     // giriş butonuna basıldıktan sonraki view'a geçme alanında
  //     disabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(15),
  //       borderSide: const BorderSide(
  //         color: Colors.orange,
  //         width: 1,
  //       ),
  //     ),

  //     // --------- hata durumunda
  //     focusedErrorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(15),
  //       borderSide: const BorderSide(
  //         color: Colors.red,
  //         width: 1,
  //       ),
  //     ),

  //     // --------- hata durumunda
  //     errorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(15),
  //       borderSide: const BorderSide(
  //         color: Colors.red,
  //         width: 1,
  //       ),
  //     ),

  //     // --------- tıklandığında
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(15),
  //       borderSide: const BorderSide(
  //         color: Colors.indigo,
  //         width: 1,
  //       ),
  //     ),

  //     // --------- tıklandığında
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(15),
  //       borderSide: const BorderSide(
  //         color: Colors.indigo,
  //         width: 1.5,
  //       ),
  //     ),
  //   ),
  // );
}
