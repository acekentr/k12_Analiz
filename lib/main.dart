import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:k12_analiz/examples/views/analiz_test_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
} //test

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('tr', 'TR'),
      ],
      locale: Locale('tr', 'TR'),
      fallbackLocale: Locale('en', 'UK'),
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
      home: AnalizTestView(),
    );
  }
}
