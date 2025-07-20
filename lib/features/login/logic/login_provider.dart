import 'package:dio/dio.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isPasswordHidden = true;

  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoginLoading = false;
  Future<bool?> login() async {
    if (formKey.currentState!.validate()) {
      isLoginLoading = true;
      notifyListeners();
      try {
        final response = await DioFactory.postData(
          path: ApiConstants.login,
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        isLoginLoading = false;
        final status = response.data['status'];
        notifyListeners();
        return status;
      } on DioException catch (_) {
        isLoginLoading = false;
        notifyListeners();
        return false;
      }
    }
    return null;
  }
}
