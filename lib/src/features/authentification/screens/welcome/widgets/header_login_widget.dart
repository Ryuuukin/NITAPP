// header_login_widget.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/image_strings.dart';
import 'package:app/src/constants/text_string.dart';
import 'package:app/src/constants/sizes.dart';

class HeaderLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          nWelcomeImage,
          width: nImageSize,
          height: nImageSize,
          alignment: Alignment.centerLeft,
        ),
        const SizedBox(width: 22),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              nAppName,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: nFontSizeLarge,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
