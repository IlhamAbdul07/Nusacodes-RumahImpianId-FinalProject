import 'package:flutter/material.dart';
import 'package:nusacodes_final_project/pages/home_page.dart';
import 'package:nusacodes_final_project/pages/kpr_page.dart';
import 'package:nusacodes_final_project/pages/main_page.dart';
import 'package:nusacodes_final_project/pages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rumah Impian.id',
      theme: ThemeData(),
      home: const MainPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/KPR': (context) => const KprPage(),
        '/setting': (context) => const SettingPage(),
      },
    );
  }
}
