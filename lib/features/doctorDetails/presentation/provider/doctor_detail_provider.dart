import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../homePage/data/models/doctor_model.dart';
import '../../data/repository/doctor_detail_repository.dart';
import '../../domain/use_case/doctor_detail_use_case.dart';

// Enum for status
enum DoctorDetailStatus { initial, loading, loaded, error }

// State class
class DoctorDetailState {
  final DoctorModel? doctor;
  final bool isLoading;
  final String? error;
  final DoctorDetailStatus status;

  DoctorDetailState(
      {this.doctor, this.isLoading = false, this.error, this.status = DoctorDetailStatus.initial});

  factory DoctorDetailState.initial() => DoctorDetailState();

  factory DoctorDetailState.loading() =>
      DoctorDetailState(isLoading: true, status: DoctorDetailStatus.loading);

  factory DoctorDetailState.loaded(DoctorModel doctor) =>
      DoctorDetailState(doctor: doctor, status: DoctorDetailStatus.loaded);

  factory DoctorDetailState.error(String error) =>
      DoctorDetailState(error: error, status: DoctorDetailStatus.error);
}

// Notifier class
class DoctorDetailNotifier extends StateNotifier<DoctorDetailState> {
  final DoctorDetailsUseCase getDoctorDetailsUseCase;

  DoctorDetailNotifier({required this.getDoctorDetailsUseCase})
      : super(DoctorDetailState.initial());

  Future<void> fetchDoctorDetails(int doctorId) async {
    state = DoctorDetailState.loading();
    try {
      final doctorDetails = await getDoctorDetailsUseCase(doctorId);
      state = DoctorDetailState.loaded(doctorDetails);
    } catch (e) {
      state = DoctorDetailState.error(e.toString());
    }
  }
}

final doctorDetailNotifierProvider =
    StateNotifierProvider<DoctorDetailNotifier, DoctorDetailState>((ref) {
  final getDoctorDetailsUseCase = ref.read(getDoctorDetailUseCaseProvider);
  return DoctorDetailNotifier(getDoctorDetailsUseCase: getDoctorDetailsUseCase);
});

final getDoctorDetailUseCaseProvider = Provider((ref) {
  final repository = ref.read(doctorDetailRepositoryProvider);
  return DoctorDetailsUseCase(repository: repository);
});

final doctorDetailRepositoryProvider = Provider((ref) {
  return DoctorDetailRepositoryImpl();
});
