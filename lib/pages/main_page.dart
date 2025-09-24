import 'package:flutter/material.dart';
import 'package:nusacodes_final_project/pages/home_page.dart';
import 'package:nusacodes_final_project/pages/kpr_page.dart';
import 'package:nusacodes_final_project/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

var index = 0;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: [HomePage(), KprPage(), ProfilePage()][index]);
  }
}
