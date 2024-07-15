import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/sizes.dart';
import 'package:app/src/features/authentification/models/signup_model.dart';
import 'package:app/src/features/authentification/controllers/signup_controller.dart';

class FormSignupWidget extends StatelessWidget {
  final SignupModel model;
  final SignupController controller;

  const FormSignupWidget({required this.model, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _SignupText(),
        const SizedBox(height: 35),
        _NameField(model: model),
        const SizedBox(height: 20),
        _SurnameField(model: model),
        const SizedBox(height: 20),
        _EmailField(model: model),
        const SizedBox(height: 20),
        _PasswordField(controller: controller, model: model),
        const SizedBox(height: 20),
        _PasswordSubmitField(controller: controller, model: model),
        const SizedBox(height: 30),
        _SignupButton(model: model),
      ],
    );
  }
}

class _SignupText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Регистрация",
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

class _NameField extends StatelessWidget {
  final SignupModel model;

  const _NameField({required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nTextFormWidth,
      child: TextFormField(
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: model.nameHintText,
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

class _SurnameField extends StatelessWidget {
  final SignupModel model;

  const _SurnameField({required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nTextFormWidth,
      child: TextFormField(
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: model.surnameHintText,
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

class _EmailField extends StatelessWidget {
  final SignupModel model;

  const _EmailField({required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nTextFormWidth,
      child: TextFormField(
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

class _PasswordField extends StatefulWidget {
  final SignupController controller;
  final SignupModel model;

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

class _PasswordSubmitField extends StatefulWidget {
  final SignupController controller;
  final SignupModel model;

  const _PasswordSubmitField({required this.controller, required this.model});

  @override
  __PasswordSubmitFieldState createState() => __PasswordSubmitFieldState();
}

class __PasswordSubmitFieldState extends State<_PasswordSubmitField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: nTextFormWidth,
      child: TextFormField(
        obscureText: widget.controller.obscureText,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: widget.model.passwordSubmitHintText,
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

class _SignupButton extends StatelessWidget {
  final SignupModel model;

  const _SignupButton({required this.model});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Perform signup action
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(nBorderRadius),
        ),
      ),
      child: Text(
        model.signupButtonText,
        style: const TextStyle(
          color: nGradientColorFirst,
          fontSize: nButtonFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
