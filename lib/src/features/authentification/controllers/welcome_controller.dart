// controllers/welcome_controller.dart
import 'package:flutter/material.dart';

class WelcomeController {
  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
  }
}
