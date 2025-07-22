import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/features/home/logic/home_provider.dart';
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
              CustomTextButton(onPressed: () {}, text: 'See All'),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
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
                        provider.doctors[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        provider.doctors[index].specialization.name +
                            ' | ' +
                            provider.doctors[index].degree,
                        style: const TextStyle(
                          color: AppColors.textBodyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${provider.doctors[index].city.name} | ${provider.doctors[index].city.governorate.name}',
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
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 5,
          )
        ],
      );
    });
  }
}
