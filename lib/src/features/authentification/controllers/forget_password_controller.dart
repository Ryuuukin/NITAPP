import 'package:flutter/material.dart';

class ForgetPasswordController {
  final TextEditingController emailController = TextEditingController();

  void resetPassword() {
    final email = emailController.text;
    // Add your password reset logic here
    print("Password reset email sent to $email");
  }
}
