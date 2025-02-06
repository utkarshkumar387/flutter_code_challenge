import '../../../homePage/data/models/doctor_model.dart';
import '../../../homePage/domain/entity/doctor_entity.dart';

abstract class DoctorDetailRepository {
  Future<DoctorModel> getDoctorDetails(int doctorId);
}
