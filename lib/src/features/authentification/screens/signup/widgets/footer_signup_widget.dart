import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/sizes.dart';
import 'package:app/src/features/authentification/models/signup_model.dart';
import 'package:app/src/features/authentification/screens/welcome/welcome_screen.dart';

class FooterSignupWidget extends StatelessWidget {
  final SignupModel model;

  const FooterSignupWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    // Split the loginText into parts
    final parts = model.loginText.split(" ");
    final firstPart = parts.sublist(0, parts.length - 1).join(" ");
    final lastPart = parts.last;

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            firstPart,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: nFontSizeSmall,
            ),
          ),
          TextButton(
            onPressed: () => Get.to(() => WelcomeScreen()),
            child: Text(
              lastPart,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: nFontSizeSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
