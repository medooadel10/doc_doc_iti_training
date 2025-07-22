import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctor_tile.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  final List<DoctorModel> doctors;
  const DoctorsScreen({Key? key, required this.doctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorTile(doctor: doctor);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}
