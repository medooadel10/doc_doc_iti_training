import 'package:dio/dio.dart';
import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/appointments/model/appointments_response_model.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  final List<AppointmentModel> appointments = [];

  void getAppointments() async {
    try {
      final token = LocalStorage.token;
      final response = await DioFactory.getData(
        path: ApiConstants.appointmentIndex,
        token: token,
      );
      final data = AppointmentsResponseModel.fromJson(response.data);
      if (data.status) {
        appointments.clear();
        appointments.addAll(data.data);
        notifyListeners();
      }
    } on DioException catch (_) {}
  }
}
