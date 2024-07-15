// footer_login_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/sizes.dart';
import 'package:app/src/features/authentification/models/welcome_model.dart';
import 'package:app/src/features/authentification/screens/signup/signup_screen.dart';

class FooterLoginWidget extends StatelessWidget {
  final WelcomeModel model;

  const FooterLoginWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    // Split the registerText into parts
    final parts = model.registerText.split(" ");
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
            onPressed: () => Get.to(() => SignupScreen()),
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
