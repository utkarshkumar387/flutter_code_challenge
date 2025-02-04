import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/doctor_entity.dart';
import '../provider/doctor_provider.dart';
import 'widgets/doctor_list_tile.dart';

enum SortOrder { none, ascending, descending }

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends ConsumerState<HomePage> {
  SortOrder _sortOrder = SortOrder.none;
  @override
  void initState() {
    super.initState();
    // Fetch doctors when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(doctorsProvider.notifier).fetchDoctors();
    });
  }

  void _setSortOrder(SortOrder order) {
    setState(() {
      _sortOrder = order;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HealthConnect',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final doctorsState = ref.watch(doctorsProvider);

          switch (doctorsState.status) {
            case DoctorsStatus.initial:
              return const Center(child: Text('Initialize doctors'));
            case DoctorsStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case DoctorsStatus.loaded:
              List<DoctorEntity> sortedDoctors = doctorsState.doctors;

              if (_sortOrder == SortOrder.ascending) {
                sortedDoctors.sort((minExp, maxExp) =>
                    minExp.settings.yearsExperience.compareTo(maxExp.settings.yearsExperience));
              } else if (_sortOrder == SortOrder.descending) {
                sortedDoctors.sort((minExp, maxExp) =>
                    maxExp.settings.yearsExperience.compareTo(minExp.settings.yearsExperience));
              }
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Doctors",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => DoctorListTile(doctor: sortedDoctors[index]),
                      childCount: sortedDoctors.length,
                    ),
                  ),
                ],
              );

            case DoctorsStatus.error:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${doctorsState.errorMessage ?? 'Unknown error'}'),
                    ElevatedButton(
                      onPressed: () => ref.read(doctorsProvider.notifier).fetchDoctors(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(100, 600, 100, 100),
            items: [
              const PopupMenuItem(
                value: SortOrder.ascending,
                child: Text('Sort by Increasing Experience'),
              ),
              const PopupMenuItem(
                value: SortOrder.descending,
                child: Text('Sort by Decreasing Experience'),
              ),
              const PopupMenuItem(
                value: SortOrder.none,
                child: Text('Clear Sorting'),
              ),
            ],
          ).then((value) {
            if (value != null) {
              _setSortOrder(value);
            }
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.sort, color: Colors.white),
      ),
    );
  }
}
