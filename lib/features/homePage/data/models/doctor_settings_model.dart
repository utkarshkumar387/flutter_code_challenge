import '../../domain/entity/doctor_settings_entity.dart';

class DoctorSettingsModel extends DoctorSettingsEntity {
  const DoctorSettingsModel(
      {required super.id,
      required super.userId,
      required super.practice,
      required super.aboutEn,
      required super.education,
      required super.yearsExperience,
      required super.supportedLanguages,
      required super.acceptingNewPatients,
      required super.countries});

  factory DoctorSettingsModel.fromJson(Map<String, dynamic> json) {
    return DoctorSettingsModel(
      id: json['id'],
      userId: json['user_id'],
      practice: json['practice'] ?? "",
      aboutEn: json['about_en'] ?? "",
      education: json['education'] ?? "",
      yearsExperience: json['years_experience'] ?? "",
      acceptingNewPatients: json['accepting_new_patients'] ?? 0,
      supportedLanguages: (json['supported_languages'] != null)
          ? List<String>.from(json['supported_languages'])
          : [],
      countries: (json['countries'] != null) ? List<String>.from(json['countries']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'practice': practice,
      'about_en': aboutEn,
      'education': education,
      'years_experience': yearsExperience,
      'accepting_new_patients': acceptingNewPatients,
      'supported_languages': supportedLanguages,
      'countries': countries,
    };
  }
}
