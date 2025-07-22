class AddAppointmentRequestBody {
  final int doctorId;
  final String dateTime;
  final String notes;

  AddAppointmentRequestBody(
      {required this.doctorId, required this.dateTime, required this.notes});

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'start_time': dateTime,
      'notes': notes,
    };
  }
}
