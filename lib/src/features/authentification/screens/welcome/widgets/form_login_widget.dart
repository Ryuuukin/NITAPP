// form_login_widget.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/sizes.dart';
import 'package:app/src/constants/text_string.dart';
import 'package:app/src/features/authentification/models/welcome_model.dart';
import 'package:app/src/features/authentification/controllers/welcome_controller.dart';
import 'package:app/src/features/authentification/screens/forget_password/forget_password_screen.dart';

class FormLoginWidget extends StatelessWidget {
  final WelcomeModel model;
  final WelcomeController controller;

  const FormLoginWidget({required this.model, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _LoginText(),
        const SizedBox(height: 35),
        _UsernameField(model: model),
        const SizedBox(height: 20),
        _PasswordField(controller: controller, model: model),
        _ForgotPasswordButton(model: model),
        const SizedBox(height: 10),
        _LoginButton(model: model),
        const SizedBox(height: 30),
        _LoginWithEcpButton(model: model),
      ],
    );
  }
}

class _LoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Войти",
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

class _UsernameField extends StatelessWidget {
  final WelcomeModel model;

  const _UsernameField({required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nTextFormWidth,
      child: TextFormField(
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: model.usernameHintText,
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

class _PasswordField extends StatefulWidget {
  final WelcomeController controller;
  final WelcomeModel model;

  const _PasswordField({required this.controller, required this.model});

  @override
  __PasswordFieldState createState() => __PasswordFieldState();
}

class __PasswordFieldState extends State<_PasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nTextFormWidth,
      child: TextFormField(
        obscureText: widget.controller.obscureText,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: widget.model.passwordHintText,
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              widget.controller.obscureText ? Icons.visibility : Icons.visibility_off,
              color: widget.controller.obscureText ? Colors.grey : Theme.of(context).primaryColor,
            ),
            onPressed: () {
              setState(() {
                widget.controller.toggleObscureText();
              });
            },
          ),
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
class _ForgotPasswordButton extends StatelessWidget {
  final WelcomeModel model;

  const _ForgotPasswordButton({required this.model});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 33),
        child: Transform.translate(
          offset: const Offset(0, -8),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
              );
            },
            child: Text(
              model.forgotPasswordText,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: nFontSizeSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _LoginButton extends StatelessWidget {
  final WelcomeModel model;

  const _LoginButton({required this.model});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Perform login action
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(nBorderRadius),
        ),
      ),
      child: Text(
        model.loginButtonText,
        style: const TextStyle(
          color: nGradientColorFirst,
          fontSize: nButtonFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LoginWithEcpButton extends StatelessWidget {
  final WelcomeModel model;

  const _LoginWithEcpButton({required this.model});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Perform login action
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(nBorderRadius),
        ),
      ),
      child: Text(
        model.loginWithEcpButtonText,
        style: const TextStyle(
          color: nGradientColorFirst,
          fontSize: nButtonFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
