import 'package:docdoc_app/core/widgets/custom_button.dart';
import 'package:docdoc_app/features/login/logic/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSubmitBtn extends StatelessWidget {
  const LoginSubmitBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();
    return Consumer<LoginProvider>(builder: (context, _, child) {
      if (provider.isLoginLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return CustomButton(
        onPressed: () async {
          final result = await provider.login();
          if (result != null && result) {
            SnackBar snackBar = const SnackBar(
                content: Text(
              'You are logged in successfully',
            ));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (result != null && !result) {
            SnackBar snackBar = const SnackBar(
                content: Text(
              'Credentails dont correct',
            ));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        text: 'Login',
      );
    });
  }
}
