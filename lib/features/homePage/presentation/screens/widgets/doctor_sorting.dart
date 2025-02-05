import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/features/homePage/presentation/screens/home_page.dart';

class DoctorSorting extends StatelessWidget {
  final SortOrder sortOrder;
  final ValueChanged<SortOrder?> onSortOrderChanged;

  const DoctorSorting({
    super.key,
    required this.sortOrder,
    required this.onSortOrderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog<SortOrder>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Sort By',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile<SortOrder>(
                    title: Text(
                      'Sort by Increasing Experience',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    value: SortOrder.ascending,
                    groupValue: sortOrder,
                    onChanged: (SortOrder? value) {
                      Navigator.of(context).pop(value);
                    },
                  ),
                  RadioListTile<SortOrder>(
                    title: const Text('Sort by Decreasing Experience'),
                    value: SortOrder.descending,
                    groupValue: sortOrder,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    onChanged: (SortOrder? value) {
                      Navigator.of(context).pop(value);
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(SortOrder.none);
                  },
                  child: const Text('Clear Sorting'),
                ),
              ],
            );
          },
        ).then((value) {
          if (value != null) {
            onSortOrderChanged(value);
          }
        });
      },
      child: const Icon(Icons.sort),
    );
  }
}
