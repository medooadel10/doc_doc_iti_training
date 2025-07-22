import 'package:dio/dio.dart';
import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/doctor_details/models/add_appointment_request_body.dart';
import 'package:docdoc_app/features/doctor_details/models/add_appointment_response_model.dart';
import 'package:flutter/material.dart';

class DoctorDetailsProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final dateTimeController = TextEditingController();
  final notesController = TextEditingController();

  Future<bool?> addAppointment(int doctorId) async {
    if (formKey.currentState?.validate() ?? false) {
      final token = LocalStorage.token;
      try {
        final response = await DioFactory.postData(
          path: ApiConstants.appointmentStore,
          data: AddAppointmentRequestBody(
            doctorId: doctorId,
            dateTime: dateTimeController.text,
            notes: notesController.text,
          ).toJson(),
          token: token,
        );
        final data = AddAppointmentResponseModel.fromJson(response.data);
        notifyListeners();
        return data.status;
      } on DioException catch (_) {
        return false;
      }
    }
    return null;
  }
}
