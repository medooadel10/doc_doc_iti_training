import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_field.dart';
import 'package:docdoc_app/features/doctor_details/logic/doctor_details_provider.dart';
import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name),
      ),
      body: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRtcAdqTgmM7vV8XEkpGumjp0Mcg4TsjTBPQ&s',
                            width: 74,
                            height: 74,
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
                                doctor.specialization.name +
                                    ' | ' +
                                    doctor.degree,
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
                    const Divider(
                      color: AppColors.textBodyColor,
                      thickness: 0.5,
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        const Text(
                          'About me',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          doctor.description,
                          style: const TextStyle(
                            color: AppColors.textBodyColor,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Working Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${doctor.startTime} - ${doctor.endTime}',
                          style: const TextStyle(
                            color: AppColors.textBodyColor,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Location',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${doctor.address}, ${doctor.city.name}, ${doctor.city.governorate.name}',
                          style: const TextStyle(
                            color: AppColors.textBodyColor,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Pricing',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${doctor.appointPrice} EGP',
                          style: const TextStyle(
                            color: AppColors.textBodyColor,
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            CustomButton(
                onPressed: () {
                  final provider = context.read<DoctorDetailsProvider>();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Appointment Confirmation',
                        style: TextStyle(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      content: Form(
                        key: provider.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 14,
                          children: [
                            Text(
                              'Do you want to make an appointment with Dr. ${doctor.name}?',
                            ),
                            CustomTextField(
                              controller: provider.dateTimeController,
                              hintText: 'Enter the start time',
                              keyboardType: TextInputType.datetime,
                              readOnly: true,
                              validator: (p0) => p0?.isEmpty == true
                                  ? 'Start time is required'
                                  : null,
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                  initialDate: DateTime.now(),
                                );
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (date != null && time != null) {
                                  provider.dateTimeController.text =
                                      date.toString().split(' ').first +
                                          " " +
                                          time.format(context).split(' ').first;
                                }
                              },
                            ),
                            CustomTextField(
                              controller: provider.notesController,
                              hintText: 'Enter the notes',
                              keyboardType: TextInputType.text,
                              validator: (p0) => p0?.isEmpty == true
                                  ? 'Notes are required'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        CustomTextButton(
                          onPressed: () => context.pop(),
                          text: 'Cancel',
                        ),
                        CustomTextButton(
                          onPressed: () async {
                            final response =
                                await provider.addAppointment(doctor.id);
                            if (response == true) {
                              context.pop();
                              Fluttertoast.showToast(
                                  msg: 'Appointment added successfully');
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Failed to add appointment');
                            }
                          },
                          text: 'Confirm',
                        ),
                      ],
                    ),
                  );
                },
                text: 'Make An Appointment'),
          ],
        ).paddingSymmetric(vertical: 10, horizontal: 16),
      ),
    );
  }
}
