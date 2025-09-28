import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              subtitle: Text('Manage your profile settings'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              subtitle: Text('Notification preferences'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy'),
              subtitle: Text('Privacy settings'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              subtitle: Text('App version and information'),
            ),
          ],
        ),
      ),
    );
  }
}
