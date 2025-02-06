import 'package:flutter/material.dart';

@immutable
class DoctorSettingsEntity {
  final int id;
  final int userId;
  final String practice;
  final String aboutEn;
  final String education;
  final int yearsExperience;
  final int acceptingNewPatients;
  final List<String> supportedLanguages;
  final List<String> countries;

  const DoctorSettingsEntity(
      {required this.id,
      required this.userId,
      required this.practice,
      required this.aboutEn,
      required this.education,
      required this.yearsExperience,
      required this.supportedLanguages,
      required this.acceptingNewPatients,
      required this.countries});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorSettingsEntity &&
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
