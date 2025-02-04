import '../../../homePage/domain/entity/doctor_entity.dart';
import '../repository/doctor_detail_repository.dart';

class DoctorDetailsUseCase {
  final DoctorDetailRepository repository;

  DoctorDetailsUseCase({required this.repository});

  Future<DoctorEntity> call(int doctorId) async {
    return await repository.getDoctorDetails(doctorId);
  }
}
