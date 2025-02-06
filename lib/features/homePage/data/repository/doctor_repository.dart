import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../domain/repository/doctor_repository.dart';
import '../models/doctor_model.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  DoctorRepositoryImpl();

  @override
  Future<List<DoctorModel>> getDoctors() async {
    try {
      // Read the JSON file from assets
      final String jsonString = await rootBundle.loadString('assets/data/all_doctors.json');

      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final List<dynamic> doctorsJson = jsonMap['data']['doctors'];

      return doctorsJson.map((doctorJson) => DoctorModel.fromJson(doctorJson)).toList();
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }
}
