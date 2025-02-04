import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/shared/doctor_avatar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_code_challenge/features/doctorDetails/presentation/provider/doctor_detail_provider.dart';

import 'widgets/doctor_about.dart';
import 'widgets/doctor_accepting_chip.dart';
import 'widgets/doctor_countries.dart';
import 'widgets/doctor_education.dart';
import 'widgets/doctor_info.dart';
import 'widgets/doctor_languages.dart';

class DoctorDetailsScreen extends ConsumerStatefulWidget {
  static const routeName = '/doctorDetails';
  final int doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  DoctorDetailsScreenState createState() => DoctorDetailsScreenState();
}

class DoctorDetailsScreenState extends ConsumerState<DoctorDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(doctorDetailNotifierProvider.notifier).fetchDoctorDetails(widget.doctorId));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(doctorDetailNotifierProvider);
    final isAcceptingNewPatients = state.doctor?.settings.acceptingNewPatients == 1 ? true : false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (state.status == DoctorDetailStatus.loaded)
            DoctorAcceptingChip(isAcceptingNewPatients: isAcceptingNewPatients),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(doctorDetailNotifierProvider);

          switch (state.status) {
            case DoctorDetailStatus.initial:
              return const Center(child: Text('Initialize doctor details'));
            case DoctorDetailStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case DoctorDetailStatus.loaded:
              final doctor = state.doctor!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorAvatar(
                      avatarUrl: doctor.avatar!,
                      size: 50,
                    ),
                    const SizedBox(height: 16),
                    DoctorInfo(
                      firstName: doctor.firstName,
                      lastName: doctor.lastName,
                      practice: doctor.settings.practice,
                      yearsExperience: doctor.settings.yearsExperience,
                      consultationCount: doctor.consultationCount,
                    ),
                    const SizedBox(height: 24),
                    DoctorAbout(about: doctor.settings.aboutEn),
                    const SizedBox(height: 16),
                    DoctorLanguages(languages: doctor.settings.supportedLanguages),
                    const SizedBox(height: 16),
                    DoctorEducation(education: doctor.settings.education),
                    const SizedBox(height: 16),
                    DoctorCountries(countries: doctor.settings.countries),
                  ],
                ),
              );
            case DoctorDetailStatus.error:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${state.error ?? 'Unknown error'}'),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(doctorDetailNotifierProvider.notifier)
                          .fetchDoctorDetails(widget.doctorId),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
