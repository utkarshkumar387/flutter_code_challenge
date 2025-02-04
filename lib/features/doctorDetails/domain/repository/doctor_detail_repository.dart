import '../../../homePage/domain/entity/doctor_entity.dart';

abstract class DoctorDetailRepository {
  Future<DoctorEntity> getDoctorDetails(int doctorId);
}
