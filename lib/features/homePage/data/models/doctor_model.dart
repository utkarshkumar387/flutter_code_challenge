import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../domain/entity/doctor_entity.dart';

class DoctorModel {
  Future<List<DoctorEntity>> getDoctors() async {
    try {
      // Read the JSON file from assets
      final String jsonString = await rootBundle.loadString('assets/data/all_doctors.json');

      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final List<dynamic> doctorsJson = jsonMap['data']['doctors'];

      return doctorsJson.map((doctorJson) => DoctorEntity.fromJson(doctorJson)).toList();
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }
}
