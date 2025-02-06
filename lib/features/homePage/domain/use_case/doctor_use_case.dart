import '../../data/models/doctor_model.dart';
import '../repository/doctor_repository.dart';

class GetDoctorsUseCase {
  final DoctorRepository repository;

  GetDoctorsUseCase({required this.repository});

  Future<List<DoctorModel>> call() async {
    return await repository.getDoctors();
  }
}
