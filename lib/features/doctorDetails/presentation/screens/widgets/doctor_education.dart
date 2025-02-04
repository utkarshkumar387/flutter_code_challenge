import 'package:flutter/material.dart';

class DoctorEducation extends StatelessWidget {
  final String education;

  const DoctorEducation({Key? key, required this.education}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          education,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}