import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/features/home/logic/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSpecilaities extends StatelessWidget {
  const HomeSpecilaities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Column(
        spacing: 5,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Doctor Speciality',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text100Color,
                  ),
                ),
              ),
              CustomTextButton(
                onPressed: () {},
                text: 'See All',
              ),
            ],
          ),
          SizedBox(
            height: 95,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Column(
                spacing: 5,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.text80Color,
                    child: Icon(
                      Icons.image,
                    ),
                    radius: 30,
                  ),
                  Text(
                    provider.speciliaztions[index].name,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: provider.speciliaztions.length,
            ),
          )
        ],
      );
    });
  }
}
