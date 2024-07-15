import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/sizes.dart';
import 'package:app/src/features/authentification/models/forget_password_model.dart';
import 'package:app/src/features/authentification/controllers/forget_password_controller.dart';
import 'package:app/src/constants/text_string.dart';

class FormForgetPasswordWidget extends StatelessWidget {
  final ForgetPasswordController controller;
  final ForgetPasswordModel model;

  const FormForgetPasswordWidget({required this.controller, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ForgetPasswordText(),
        const SizedBox(height: 50),
        _EmailField(controller: controller, model: model),
        const SizedBox(height: 60),
        _ResetPasswordButton(controller: controller, model: model),
      ],
    );
  }
}

class _ForgetPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Забыли пароль",
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: nTitleFontSize,
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
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  final ForgetPasswordController controller;
  final ForgetPasswordModel model;

  const _EmailField({required this.controller, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nTextFormWidth,
      child: TextFormField(
        controller: controller.emailController,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: model.emailHintText,
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(nBorderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(nBorderRadius),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        ),
      ),
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  final ForgetPasswordController controller;
  final ForgetPasswordModel model;

  const _ResetPasswordButton({required this.controller, required this.model});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.resetPassword();
        showForgetPasswordNotification(context);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(nBorderRadius),
        ),
      ),
      child: Text(
        model.resetPasswordButtonText,
        style: const TextStyle(
          color: nGradientColorFirst,
          fontSize: nButtonFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void showForgetPasswordNotification(BuildContext context) {
    // Show a dialog with the notification
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.25), // Set custom barrier color with opacity
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(nBorderRadius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 15.0),
                  child: Column(
                    children: [
                      Text(
                        nForgetPasswordNotificationTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        nForgetPasswordNotification,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text(
                      "Готово",
                      style: TextStyle(
                        color: nBrightTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
