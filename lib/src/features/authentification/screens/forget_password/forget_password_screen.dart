import 'package:flutter/material.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/authentification/screens/forget_password/widgets/forget_password_form_widget.dart';
import 'package:app/src/features/authentification/controllers/forget_password_controller.dart';
import 'package:app/src/features/authentification/models/forget_password_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final ForgetPasswordController controller = ForgetPasswordController();
  final ForgetPasswordModel model = ForgetPasswordModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: nGradientColors,
            stops: [0.13, 0.52, 1.0],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: FormForgetPasswordWidget(controller: controller, model: model),
            ),
          ),
        ),
      ),
    );
  }
}
