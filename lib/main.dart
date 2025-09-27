import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nusacodes_final_project/bloc/theme_cubit.dart';
import 'package:nusacodes_final_project/pages/home_page.dart';
import 'package:nusacodes_final_project/pages/kpr_page.dart';
import 'package:nusacodes_final_project/pages/main_page.dart';
import 'package:nusacodes_final_project/pages/setting_page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage; // << ini yang baru

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rumah Impian.id',
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: themeMode,
            home: const MainPage(),
            routes: {
              '/home': (context) => const HomePage(),
              '/KPR': (context) => const KprPage(),
              '/setting': (context) => const SettingPage(),
            },
          );
        },
      ),
    );
  }
}
