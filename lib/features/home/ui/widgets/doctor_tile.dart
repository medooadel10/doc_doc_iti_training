import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/router/routes.dart';
import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:flutter/material.dart';

class DoctorTile extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorTile({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.doctorDetails, arguments: doctor);
      },
      child: Row(
        spacing: 10,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRtcAdqTgmM7vV8XEkpGumjp0Mcg4TsjTBPQ&s',
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  doctor.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  doctor.specialization.name + ' | ' + doctor.degree,
                  style: const TextStyle(
                    color: AppColors.textBodyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${doctor.city.name} | ${doctor.city.governorate.name}',
                  style: const TextStyle(
                    color: AppColors.textBodyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
