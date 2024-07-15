// welcome_screen.dart

import 'package:flutter/material.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/authentification/models/welcome_model.dart';
import 'package:app/src/features/authentification/controllers/welcome_controller.dart';
import 'package:app/src/features/authentification/screens/welcome/widgets/header_login_widget.dart';
import 'package:app/src/features/authentification/screens/welcome/widgets/form_login_widget.dart';
import 'package:app/src/features/authentification/screens/welcome/widgets/footer_login_widget.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeModel _model = WelcomeModel();
  final WelcomeController _controller = WelcomeController();

  WelcomeScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 70),
              HeaderLoginWidget(),
              const SizedBox(height: 40),
              FormLoginWidget(model: _model, controller: _controller),
              const SizedBox(height: 100),
              FooterLoginWidget(model: _model),
            ],
          ),
        ),
      ),
    );
  }
}
