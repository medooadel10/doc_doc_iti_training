import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/features/login/ui/widgets/login_dont_have_account.dart';
import 'package:docdoc_app/features/login/ui/widgets/login_form.dart';
import 'package:docdoc_app/features/login/ui/widgets/login_submit_btn.dart';
import 'package:docdoc_app/features/login/ui/widgets/login_title_desc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Column(
          spacing: 50,
          children: [
            LoginTitleAndDesc(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 18,
                  children: [
                    LoginForm(),
                    LoginSubmitBtn(),
                  ],
                ),
              ),
            ),
            LoginDontHaveAccount(),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
