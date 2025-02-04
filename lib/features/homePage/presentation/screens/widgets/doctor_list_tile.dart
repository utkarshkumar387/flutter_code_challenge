import 'package:flutter/material.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../shared/doctor_avatar.dart';
import '../../../domain/entity/doctor_entity.dart';

class DoctorListTile extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorListTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.3),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: SizedBox(
          width: 60,
          child: DoctorAvatar(
            avatarUrl: doctor.avatar ?? "",
            size: 30,
          ),
        ),
        title: Text(
          '${doctor.firstName} ${doctor.lastName}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              doctor.settings.practice,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Exp: ${doctor.settings.yearsExperience} years',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).colorScheme.primary,
        ),
        onTap: () {
          AppRouter.navigateToDoctorDetails(context, doctor.id);
        },
      ),
    );
  }
}
