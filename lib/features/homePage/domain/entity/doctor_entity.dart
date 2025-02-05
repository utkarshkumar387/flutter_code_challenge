import 'package:flutter/foundation.dart';

@immutable
class DoctorEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String? avatar;
  final int consultationCount;
  final DoctorSettings settings;

  const DoctorEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.consultationCount,
    this.avatar,
    required this.settings,
  });

  factory DoctorEntity.fromJson(Map<String, dynamic> json) {
    return DoctorEntity(
      id: json['id'],
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      avatar: json['avatar'] ?? "",
      consultationCount: json['consultation_count'] ?? "",
      settings: DoctorSettings.fromJson(json['doctor_settings']),
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          avatar == other.avatar &&
          consultationCount == other.consultationCount &&
          settings == other.settings;

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      avatar.hashCode ^
      consultationCount.hashCode ^
      settings.hashCode;
}

@immutable
class DoctorSettings {
  final int id;
  final int userId;
  final String practice;
  final String aboutEn;
  final String education;
  final int yearsExperience;
  final int acceptingNewPatients;
  final List<String> supportedLanguages;
  final List<String> countries;

  const DoctorSettings(
      {required this.id,
      required this.userId,
      required this.practice,
      required this.aboutEn,
      required this.education,
      required this.yearsExperience,
      required this.supportedLanguages,
      required this.acceptingNewPatients,
      required this.countries});

  factory DoctorSettings.fromJson(Map<String, dynamic> json) {
    return DoctorSettings(
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorSettings &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          practice == other.practice &&
          aboutEn == other.aboutEn &&
          education == other.education &&
          yearsExperience == other.yearsExperience &&
          acceptingNewPatients == other.acceptingNewPatients &&
          countries == other.countries &&
          supportedLanguages == other.supportedLanguages;

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      practice.hashCode ^
      aboutEn.hashCode ^
      education.hashCode ^
      yearsExperience.hashCode ^
      acceptingNewPatients.hashCode ^
      countries.hashCode ^
      supportedLanguages.hashCode;
}
