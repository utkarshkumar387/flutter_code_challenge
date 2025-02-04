import '../../domain/entity/doctor_entity.dart';
import '../../domain/repository/doctor_repository.dart';
import '../models/doctor_model.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorModel doctors;

  DoctorRepositoryImpl({required this.doctors});

  @override
  Future<List<DoctorEntity>> getDoctors() async {
    try {
      return await doctors.getDoctors();
    } catch (e) {
      rethrow;
    }
  }
}
