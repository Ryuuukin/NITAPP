import 'package:app/src/features/authentification/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:app/src/utils/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: NAppTheme.lightTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 600),
      home: const SplashScreen(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          title: const Text("National Digital Investment Platform")),
      body: Container(
        decoration: const BoxDecoration(
          gradient: NAppTheme.backgroundGradient,
        ),
        child: const Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
