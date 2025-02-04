import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/core/extensions/string_extensions.dart';

class DoctorLanguages extends StatelessWidget {
  final List<String> languages;

  const DoctorLanguages({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return (languages.isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Languages',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: languages.map((language) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      language.capitalizeFirstLetter(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  );
                }).toList(),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
