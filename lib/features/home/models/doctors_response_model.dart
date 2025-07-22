import 'package:docdoc_app/features/home/models/home_specializations_response_model.dart';

class DoctorsResponseModel {
  final String message;
  final bool status;
  final List<DoctorModel> doctors;

  DoctorsResponseModel(this.message, this.status, this.doctors);

  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorsResponseModel(
        json['message'],
        json['status'],
        (json['data'] as List<dynamic>)
            .map((e) => DoctorModel.fromJson(e))
            .toList(),
      );
}

class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final SpecializationModel specialization;
  final CityModel city;
  final num appointPrice;
  final String startTime;
  final String endTime;

  DoctorModel(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.photo,
      this.gender,
      this.address,
      this.description,
      this.degree,
      this.specialization,
      this.city,
      this.appointPrice,
      this.startTime,
      this.endTime);

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        json['id'],
        json['name'],
        json['email'],
        json['phone'],
        json['photo'],
        json['gender'],
        json['address'],
        json['description'],
        json['degree'],
        SpecializationModel.fromJson(json['specialization']),
        CityModel.fromJson(json['city']),
        json['appoint_price'],
        json['start_time'],
        json['end_time'],
      );
}

class CityModel {
  final int id;
  final String name;
  final GovernorateModel governorate;
  CityModel(this.id, this.name, this.governorate);

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
      json['id'], json['name'], GovernorateModel.fromJson(json['governrate']));
}

class GovernorateModel {
  final int id;
  final String name;

  GovernorateModel(this.id, this.name);

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      GovernorateModel(json['id'], json['name']);
}
