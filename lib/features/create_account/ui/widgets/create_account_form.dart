import 'package:docdoc_app/core/widgets/custom_text_field.dart';
import 'package:docdoc_app/features/create_account/logic/create_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CreateAccountProvider>();
    return Form(
      key: provider.formKey,
      child: Column(
        spacing: 14,
        children: [
          CustomTextField(
            controller: provider.nameController,
            hintText: 'Enter full name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            keyboardType: TextInputType.name,
          ),
          CustomTextField(
            controller: provider.emailController,
            hintText: 'Enter email address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextField(
            controller: provider.phoneNumberController,
            hintText: 'Enter Phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
          ),
          CustomTextField(
            controller: provider.passwordController,
            hintText: 'Enter Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          CustomTextField(
            controller: provider.confirmPasswordController,
            hintText: 'Enter Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your confirm password';
              } else if (value != provider.passwordController.text) {
                return 'Passwords dont match';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
