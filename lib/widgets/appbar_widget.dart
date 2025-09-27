import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusacodes_final_project/bloc/theme_cubit.dart';
import 'package:nusacodes_final_project/constants/my_color.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/icon.png', height: 32, width: 32),
      ),
      backgroundColor: MyColor.bluePrimary,
      title: const Text(
        'Rumah Impian.id',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          icon: Icon(
            context.watch<ThemeCubit>().state == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
            color: Colors.white, // Set icon color to white for better contrast
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
