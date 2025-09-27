import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color appBarColor;

  const AppbarWidget({Key? key, required this.appBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: appBarColor,
      leading: const Icon(Icons.home, color: Colors.white),
      title: const Text('Rumah Impian'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
