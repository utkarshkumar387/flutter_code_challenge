import '../../domain/entity/doctor_entity.dart';
import 'doctor_settings_model.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.consultationCount,
    super.avatar,
    required super.settings,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      avatar: json['avatar'] ?? "",
      consultationCount: json['consultation_count'] ?? "",
      settings: DoctorSettingsModel.fromJson(json['doctor_settings']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'consultation_count': consultationCount,
      'doctor_settings': settings.toJson(),
    };
  }
}
