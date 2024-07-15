import 'package:app/src/features/authentification/controllers/splash_screen_controller.dart';
import 'package:app/src/features/authentification/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/sizes.dart';
import 'package:app/src/constants/image_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late SplashScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(SplashScreenController(this));
    _controller.addListener(() {
      setState(() {});
      if (_controller.animationCompleted) {
        Future.delayed(const Duration(seconds: 2), () {
          Get.to(() => WelcomeScreen());
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FadeTransition(
              opacity: _controller.fadeOutAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _controller.slideAnimation,
                    child: FadeTransition(
                      opacity: _controller.opacityAnimation,
                      child: const Image(
                        image: AssetImage(nSplashImage),
                        width: 240, // Adjust the width to make the logo smaller
                        height: 100, // Adjust the height to make the logo smaller
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        _controller.displayText,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: nFontSizeLarge,
                          fontWeight: FontWeight.bold,
                          color: nTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
