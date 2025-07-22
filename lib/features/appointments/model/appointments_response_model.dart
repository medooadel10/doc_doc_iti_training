import 'package:docdoc_app/features/home/models/doctors_response_model.dart';

class AppointmentsResponseModel {
  final String message;
  final bool status;
  final List<AppointmentModel> data;

  AppointmentsResponseModel(this.message, this.status, this.data);

  factory AppointmentsResponseModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsResponseModel(
      json['message'] as String,
      json['status'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => AppointmentModel.fromJson(e))
          .toList(),
    );
  }
}

class AppointmentModel {
  final int id;
  final DoctorModel doctor;
  final String appointmentTime;
  final String notes;
  final String appointmentEndTime;
  final num appointmentPrice;

  AppointmentModel(
    this.id,
    this.doctor,
    this.appointmentTime,
    this.notes,
    this.appointmentEndTime,
    this.appointmentPrice,
  );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      json['id'] as int,
      DoctorModel.fromJson(json['doctor']),
      json['appointment_time'] as String,
      json['notes'] as String,
      json['appointment_end_time'] as String,
      json['appointment_price'] as num,
    );
  }
}
