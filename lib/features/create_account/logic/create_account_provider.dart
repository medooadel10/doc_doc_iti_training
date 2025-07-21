import 'package:dio/dio.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/create_account/models/auth_response_model.dart';
import 'package:docdoc_app/features/create_account/models/create_account_request_model.dart';
import 'package:flutter/material.dart';

class CreateAccountProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
  Future<bool?> createAccount() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final body = CreateAccountRequestModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneNumberController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      );
      try {
        final response = await DioFactory.postData(
          path: ApiConstants.register,
          data: body.toJson(),
        );

        isLoading = false;
        final dataResult = AuthResponseModel.fromJson(response.data);
        print(dataResult.data.token);
        notifyListeners();
        return dataResult.status;
      } on DioException catch (e) {
        isLoading = false;
        notifyListeners();
        return false;
      }
    }
    return null;
  }
}
