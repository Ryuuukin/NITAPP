import 'package:flutter/material.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/authentification/models/signup_model.dart';
import 'package:app/src/features/authentification/controllers/signup_controller.dart';
import 'package:app/src/features/authentification/screens/signup/widgets/header_signup_widget.dart';
import 'package:app/src/features/authentification/screens/signup/widgets/form_signup_widget.dart';
import 'package:app/src/features/authentification/screens/signup/widgets/footer_signup_widget.dart';

class SignupScreen extends StatelessWidget {
  final SignupModel _model = SignupModel();
  final SignupController _controller = SignupController();

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: nGradientColors,
            stops: [0.13, 0.52, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              HeaderSignupWidget(),
              const SizedBox(height: 30),
              FormSignupWidget(model: _model, controller: _controller),
              const SizedBox(height: 22),
              FooterSignupWidget(model: _model)
            ],
          ),
        ),
      ),
    );
  }
}
