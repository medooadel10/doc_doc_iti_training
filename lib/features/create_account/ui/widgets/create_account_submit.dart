import 'package:docdoc_app/core/widgets/custom_button.dart';
import 'package:docdoc_app/features/create_account/logic/create_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccountSubmit extends StatelessWidget {
  const CreateAccountSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CreateAccountProvider>();
    return Consumer<CreateAccountProvider>(
      builder: (context, value, child) {
        if (provider.isLoading)
          return const Center(
            child: CircularProgressIndicator(),
          );
        return CustomButton(
          onPressed: () async {
            final result = await provider.createAccount();
            if (result != null && result) {
              SnackBar snackBar = const SnackBar(
                  content: Text(
                'You are registered successfully',
              ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (result != null && !result) {
              SnackBar snackBar =
                  const SnackBar(content: Text('Something went wrong'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          text: 'Create Account',
        );
      },
    );
  }
}
