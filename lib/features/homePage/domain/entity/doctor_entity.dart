import 'package:flutter/foundation.dart';
import 'package:flutter_code_challenge/features/homePage/data/models/doctor_settings_model.dart';

@immutable
class DoctorEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String? avatar;
  final int consultationCount;
  final DoctorSettingsModel settings;

  const DoctorEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.consultationCount,
    this.avatar,
    required this.settings,
  });

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
