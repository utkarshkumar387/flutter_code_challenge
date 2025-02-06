import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../../homePage/data/models/doctor_model.dart';
import '../../domain/repository/doctor_detail_repository.dart';

class DoctorDetailRepositoryImpl implements DoctorDetailRepository {
  DoctorDetailRepositoryImpl();

  @override
  Future<DoctorModel> getDoctorDetails(int doctorId) async {
    try {
      // Read the JSON file from assets
      final String response = await rootBundle.loadString('assets/data/all_doctors.json');
      final data = await json.decode(response);
      final List<dynamic> doctorsJson = data['data']['doctors'];

      final doctorJson =
          doctorsJson.firstWhere((doctor) => doctor['id'] == doctorId, orElse: () => null);

      if (doctorJson != null) {
        return DoctorModel.fromJson(doctorJson);
      } else {
        throw Exception('Doctor not found');
      }
    } catch (e) {
      throw Exception('Error fetching doctor detail: $e');
    }
  }
}
