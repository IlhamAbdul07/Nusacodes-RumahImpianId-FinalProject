import 'package:flutter/material.dart';
import 'package:nusacodes_final_project/pages/home_page.dart';
import 'package:nusacodes_final_project/pages/kpr_page.dart';
import 'package:nusacodes_final_project/pages/setting_page.dart';
import 'package:nusacodes_final_project/widgets/appbar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

var index = 0;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(appBarColor: Colors.blueAccent),
      body: [HomePage(), KprPage(), SettingPage()][index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'KPR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
