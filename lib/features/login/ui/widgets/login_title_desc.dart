import 'package:docdoc_app/core/widgets/custom_auth_title_desc.dart';
import 'package:flutter/material.dart';

class LoginTitleAndDesc extends StatelessWidget {
  const LoginTitleAndDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAuthTitleDesc(
      title: 'Welcome Back',
      description:
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
    );
  }
}
