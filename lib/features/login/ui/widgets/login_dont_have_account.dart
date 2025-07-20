import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginDontHaveAccount extends StatelessWidget {
  const LoginDontHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Aren't have an account? ",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        CustomTextButton(onPressed: () {}, text: 'Sign Up')
      ],
    );
  }
}
