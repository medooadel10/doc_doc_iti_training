import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/router/routes.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/features/home/logic/home_provider.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctor_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDoctors extends StatelessWidget {
  const HomeDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Recommendation Doctors',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomTextButton(
                  onPressed: () {
                    if (provider.doctors.isNotEmpty) {
                      context.pushNamed(
                        Routes.doctors,
                        arguments: provider.doctors,
                      );
                    }
                  },
                  text: 'See All'),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                DoctorTile(doctor: provider.doctors[index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: provider.doctors.isEmpty ? 0 : 5,
          )
        ],
      );
    });
  }
}
