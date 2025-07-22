import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/features/appointments/logic/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentProvider()..getAppointments(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Appointments'),
        ),
        body: Consumer(
          builder: (context, value, child) {
            final provider = context.read<AppointmentProvider>();
            return RefreshIndicator(
              onRefresh: () async {
                return provider.getAppointments();
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => Row(
                  spacing: 10,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRtcAdqTgmM7vV8XEkpGumjp0Mcg4TsjTBPQ&s',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6,
                        children: [
                          Text(
                            provider.appointments[index].doctor.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${provider.appointments[index].doctor.specialization.name} | ${provider.appointments[index].doctor.degree}',
                            style: const TextStyle(
                              color: AppColors.text80Color,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            provider.appointments[index].appointmentTime +
                                "\n" +
                                provider.appointments[index].appointmentEndTime,
                            style: const TextStyle(
                              color: AppColors.text80Color,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
                itemCount: provider.appointments.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
