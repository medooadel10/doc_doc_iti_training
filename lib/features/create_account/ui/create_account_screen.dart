import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/features/create_account/ui/widgets/create_account_already_have_account.dart';
import 'package:docdoc_app/features/create_account/ui/widgets/create_account_form.dart';
import 'package:docdoc_app/features/create_account/ui/widgets/create_account_submit.dart';
import 'package:docdoc_app/features/create_account/ui/widgets/create_account_title_desc.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Column(
          spacing: 50,
          children: [
            CreateAccountTitleAndDesc(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 14,
                  children: [
                    CreateAccountForm(),
                    CreateAccountSubmit(),
                  ],
                ),
              ),
            ),
            CreateAccountAlreadyHaveAccount(),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
