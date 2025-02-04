import 'package:flutter_code_challenge/features/homePage/data/models/doctor_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/doctor_repository.dart';
import '../../domain/entity/doctor_entity.dart';
import '../../domain/use_case/doctor_use_case.dart';

enum DoctorsStatus { initial, loading, loaded, error }

class DoctorsState {
  final DoctorsStatus status;
  final List<DoctorEntity> doctors;
  final String? errorMessage;

  const DoctorsState({
    this.status = DoctorsStatus.initial,
    this.doctors = const [],
    this.errorMessage,
  });

  factory DoctorsState.initial() => const DoctorsState();

  factory DoctorsState.loading() => const DoctorsState(status: DoctorsStatus.loading);

  factory DoctorsState.loaded(List<DoctorEntity> doctors) => DoctorsState(
        status: DoctorsStatus.loaded,
        doctors: doctors,
      );

  factory DoctorsState.error(String message) => DoctorsState(
        status: DoctorsStatus.error,
        errorMessage: message,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DoctorsState &&
        other.status == status &&
        other.doctors == doctors &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => status.hashCode ^ doctors.hashCode ^ errorMessage.hashCode;
}

class DoctorsNotifier extends StateNotifier<DoctorsState> {
  final GetDoctorsUseCase getDoctorsUseCase;

  DoctorsNotifier({required this.getDoctorsUseCase}) : super(DoctorsState.initial());

  Future<void> fetchDoctors() async {
    state = DoctorsState.loading();
    try {
      final doctors = await getDoctorsUseCase();
      state = DoctorsState.loaded(doctors);
    } catch (e) {
      state = DoctorsState.error(e.toString());
    }
  }
}

final doctorsProvider = StateNotifierProvider<DoctorsNotifier, DoctorsState>((ref) {
  final getDoctorsUseCase = ref.read(getDoctorsUseCaseProvider);
  return DoctorsNotifier(getDoctorsUseCase: getDoctorsUseCase);
});

final getDoctorsUseCaseProvider = Provider((ref) {
  final repository = ref.read(doctorRepositoryProvider);
  return GetDoctorsUseCase(repository: repository);
});

final doctorRepositoryProvider = Provider((ref) {
  final doctorsResponse = ref.read(doctorDataSourceProvider);
  return DoctorRepositoryImpl(doctors: doctorsResponse);
});

final doctorDataSourceProvider = Provider((ref) {
  return DoctorModel();
});
