import '../../../homePage/domain/entity/doctor_entity.dart';
import '../../domain/repository/doctor_detail_repository.dart';
import '../models/doctor_detail_model.dart';

class DoctorDetailRepositoryImpl implements DoctorDetailRepository {
  final DoctorDetailModel doctorDetail;

  DoctorDetailRepositoryImpl({required this.doctorDetail});

  @override
  Future<DoctorEntity> getDoctorDetails(int doctorId) async {
    try {
      final result = await doctorDetail.getDoctorDetails(doctorId);
      return result;
    } catch (e) {
      throw Exception('Doctor not found');
    }
  }
}
