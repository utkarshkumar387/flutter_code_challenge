import 'package:flutter_code_challenge/features/homePage/data/models/doctor_model.dart';

abstract class DoctorRepository {
  Future<List<DoctorModel>> getDoctors();
}
