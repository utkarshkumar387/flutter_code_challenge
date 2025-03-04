import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/features/homePage/presentation/screens/widgets/doctor_sorting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/doctor_model.dart';
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

  void _setSortOrder(SortOrder? order) {
    setState(() {
      _sortOrder = order ?? SortOrder.none;
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
              List<DoctorModel> sortedDoctors = List.from(doctorsState.doctors);
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
      floatingActionButton: DoctorSorting(
        sortOrder: _sortOrder,
        onSortOrderChanged: _setSortOrder,
      ),
    );
  }
}
