import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/constants/text_string.dart';

class SplashScreenController with ChangeNotifier {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> opacityAnimation;
  late AnimationController fadeOutController;
  late Animation<double> fadeOutAnimation;

  String displayText = "";
  final String fullText = nSplashAppName;
  int currentIndex = 0;
  bool animationCompleted = false;

  SplashScreenController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );

    fadeOutController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    fadeOutAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: fadeOutController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(seconds: 1), () {
      animationController.forward().then((_) {
        _startTypingAnimation();
        // Mark animation as completed after animation finishes
        Future.delayed(const Duration(milliseconds: 30) * fullText.length, () {
          animationCompleted = true;
          notifyListeners();
          fadeOutController.forward(); // Start fade-out animation
        });
      });
    });
  }

  void _startTypingAnimation() {
    Future.delayed(const Duration(milliseconds: 30), _updateText);
  }

  void _updateText() {
    if (currentIndex < fullText.length) {
      displayText += fullText[currentIndex];
      currentIndex++;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 30), _updateText);
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    fadeOutController.dispose();
  }
}
