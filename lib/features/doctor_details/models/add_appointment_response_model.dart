class AddAppointmentResponseModel {
  final String message;
  final bool status;
  final AddAppointmentModel? data;

  AddAppointmentResponseModel(this.message, this.status, this.data);

  factory AddAppointmentResponseModel.fromJson(Map<String, dynamic> json) {
    return AddAppointmentResponseModel(
      json['message'] as String,
      json['status'] as bool,
      json['data'] != null
          ? AddAppointmentModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class AddAppointmentModel {
  final int id;

  AddAppointmentModel(this.id);

  factory AddAppointmentModel.fromJson(Map<String, dynamic> json) {
    return AddAppointmentModel(json['id']);
  }
}
