import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/core/extensions/string_extensions.dart';

class DoctorCountries extends StatelessWidget {
  final List<String> countries;

  const DoctorCountries({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return (countries.isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Countries',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: countries.map((country) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      country.capitalizeFirstLetter(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
            ],
          )
        : const SizedBox();
  }
}
