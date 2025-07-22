import 'package:dio/dio.dart';
import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/appointments/ui/appointments_screen.dart';
import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:docdoc_app/features/home/models/home_specializations_response_model.dart';
import 'package:docdoc_app/features/home/ui/home_body_screen.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> homeScreens = [
    const HomeBodyScreen(),
    Container(),
    const AppointmentsScreen(),
    Container(),
  ];

  final List<SpecializationModel> speciliaztions = [];
  void getSpecializations() async {
    try {
      final token = LocalStorage.token;
      final response = await DioFactory.getData(
        path: ApiConstants.specializations,
        token: token,
      );
      final data = HomeSpecializationsResponseModel.fromJson(response.data);
      if (data.status) {
        speciliaztions.addAll(data.specializations);
        notifyListeners();
      }
    } on DioException catch (_) {}
  }

  final List<DoctorModel> doctors = [];
  void getDoctors() async {
    try {
      final token = LocalStorage.token;
      final response = await DioFactory.getData(
        path: ApiConstants.doctors,
        token: token,
      );
      final data = DoctorsResponseModel.fromJson(response.data);
      if (data.status) {
        doctors.addAll(data.doctors);
        notifyListeners();
      }
    } on DioException catch (_) {}
  }
}
