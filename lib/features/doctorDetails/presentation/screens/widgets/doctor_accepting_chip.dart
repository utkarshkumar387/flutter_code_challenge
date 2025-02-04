import 'package:flutter/material.dart';

class DoctorAcceptingChip extends StatelessWidget {
  final bool isAcceptingNewPatients;

  const DoctorAcceptingChip({super.key, required this.isAcceptingNewPatients});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: isAcceptingNewPatients ? Colors.green : Colors.red, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isAcceptingNewPatients ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            isAcceptingNewPatients ? 'Accepting' : 'Not Accepting',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isAcceptingNewPatients ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
