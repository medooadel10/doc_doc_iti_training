import 'package:docdoc_app/core/widgets/custom_text_field.dart';
import 'package:docdoc_app/features/login/logic/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();
    return Consumer<LoginProvider>(
      builder: (context, _, child) {
        return Form(
          key: provider.formKey,
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                controller: provider.emailController,
                hintText: 'Enter email address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: provider.passwordController,
                hintText: 'Enter password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: provider.isPasswordHidden,
                suffixIcon: provider.isPasswordHidden
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixIcon: () {
                  provider.changePasswordVisibility();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
