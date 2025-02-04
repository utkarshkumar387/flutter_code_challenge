import 'package:flutter/material.dart';

class DoctorAbout extends StatelessWidget {
  final String about;

  const DoctorAbout({Key? key, required this.about}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          about,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}