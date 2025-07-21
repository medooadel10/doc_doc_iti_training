import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/router/routes.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class CreateAccountAlreadyHaveAccount extends StatelessWidget {
  const CreateAccountAlreadyHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an acconut ",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        CustomTextButton(
          onPressed: () {
            context.pushReplacmentNamed(Routes.login);
          },
          text: 'Sign In',
        )
      ],
    );
  }
}
