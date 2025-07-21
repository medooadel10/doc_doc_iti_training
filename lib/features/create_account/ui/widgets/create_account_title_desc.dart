import 'package:docdoc_app/core/widgets/custom_auth_title_desc.dart';
import 'package:flutter/material.dart';

class CreateAccountTitleAndDesc extends StatelessWidget {
  const CreateAccountTitleAndDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAuthTitleDesc(
      title: 'Create Account',
      description:
          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
    );
  }
}
