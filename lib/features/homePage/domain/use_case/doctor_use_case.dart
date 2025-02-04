import '../entity/doctor_entity.dart';
import '../repository/doctor_repository.dart';

class GetDoctorsUseCase {
  final DoctorRepository repository;

  GetDoctorsUseCase({required this.repository});

  Future<List<DoctorEntity>> call() async {
    return await repository.getDoctors();
  }
}
