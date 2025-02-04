import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_code_challenge/features/homePage/domain/entity/doctor_entity.dart';

class DoctorDetailModel {
  Future<DoctorEntity> getDoctorDetails(int doctorId) async {
    final String response = await rootBundle.loadString('assets/data/all_doctors.json');
    final data = await json.decode(response);
    final List<dynamic> doctorsJson = data['data']['doctors'];

    final doctorJson =
        doctorsJson.firstWhere((doctor) => doctor['id'] == doctorId, orElse: () => null);

    if (doctorJson != null) {
      return DoctorEntity.fromJson(doctorJson);
    } else {
      throw Exception('Doctor not found');
    }
  }
}
