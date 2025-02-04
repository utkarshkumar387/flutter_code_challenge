// filepath: /c:/Users/utkar/OneDrive/Desktop/Projects/skinder/flutter_code_challenge/test/features/homePage/domain/entity/doctor_entity_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_code_challenge/features/homePage/domain/entity/doctor_entity.dart';

void main() {
  group('DoctorSettings', () {
    test('should create a valid DoctorSettings instance', () {
      const doctorSettings = DoctorSettings(
        id: 1,
        userId: 2,
        practice: 'Test Practice',
        aboutEn: 'Test About',
        education: 'Test Education',
        yearsExperience: 10,
        acceptingNewPatients: 1,
        supportedLanguages: ['English', 'Spanish'],
        countries: ['USA', 'Canada'],
      );

      expect(doctorSettings.id, 1);
      expect(doctorSettings.userId, 2);
      expect(doctorSettings.practice, 'Test Practice');
      expect(doctorSettings.aboutEn, 'Test About');
      expect(doctorSettings.education, 'Test Education');
      expect(doctorSettings.yearsExperience, 10);
      expect(doctorSettings.acceptingNewPatients, 1);
      expect(doctorSettings.supportedLanguages, ['English', 'Spanish']);
      expect(doctorSettings.countries, ['USA', 'Canada']);
    });

    test('should handle empty supportedLanguages and countries', () {
      const doctorSettings = DoctorSettings(
        id: 1,
        userId: 2,
        practice: 'Test Practice',
        aboutEn: 'Test About',
        education: 'Test Education',
        yearsExperience: 10,
        acceptingNewPatients: 1,
        supportedLanguages: [],
        countries: [],
      );

      expect(doctorSettings.supportedLanguages, isEmpty);
      expect(doctorSettings.countries, isEmpty);
    });

    test('should convert from JSON', () {
      final json = {
        'id': 1,
        'user_id': 2,
        'practice': 'Test Practice',
        'about_en': 'Test About',
        'education': 'Test Education',
        'years_experience': 10,
        'accepting_new_patients': 1,
        'supported_languages': ['English', 'Spanish'],
        'countries': ['USA', 'Canada'],
      };

      final doctorSettings = DoctorSettings.fromJson(json);

      expect(doctorSettings.id, 1);
      expect(doctorSettings.userId, 2);
      expect(doctorSettings.practice, 'Test Practice');
      expect(doctorSettings.aboutEn, 'Test About');
      expect(doctorSettings.education, 'Test Education');
      expect(doctorSettings.yearsExperience, 10);
      expect(doctorSettings.acceptingNewPatients, 1);
      expect(doctorSettings.supportedLanguages, ['English', 'Spanish']);
      expect(doctorSettings.countries, ['USA', 'Canada']);
    });

    test('should convert to JSON', () {
      const doctorSettings = DoctorSettings(
        id: 1,
        userId: 2,
        practice: 'Test Practice',
        aboutEn: 'Test About',
        education: 'Test Education',
        yearsExperience: 10,
        acceptingNewPatients: 1,
        supportedLanguages: ['English', 'Spanish'],
        countries: ['USA', 'Canada'],
      );

      final json = doctorSettings.toJson();

      expect(json['id'], 1);
      expect(json['user_id'], 2);
      expect(json['practice'], 'Test Practice');
      expect(json['about_en'], 'Test About');
      expect(json['education'], 'Test Education');
      expect(json['years_experience'], 10);
      expect(json['accepting_new_patients'], 1);
      expect(json['supported_languages'], ['English', 'Spanish']);
      expect(json['countries'], ['USA', 'Canada']);
    });
  });

  group('DoctorEntity', () {
    test('should create a valid DoctorEntity instance', () {
      const doctorSettings = DoctorSettings(
        id: 1,
        userId: 2,
        practice: 'Test Practice',
        aboutEn: 'Test About',
        education: 'Test Education',
        yearsExperience: 10,
        acceptingNewPatients: 1,
        supportedLanguages: ['English', 'Spanish'],
        countries: ['USA', 'Canada'],
      );

      const doctor = DoctorEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        consultationCount: 5,
        avatar: 'https://example.com/avatar.jpg',
        settings: doctorSettings,
      );

      expect(doctor.id, 1);
      expect(doctor.firstName, 'John');
      expect(doctor.lastName, 'Doe');
      expect(doctor.consultationCount, 5);
      expect(doctor.avatar, 'https://example.com/avatar.jpg');
      expect(doctor.settings, doctorSettings);
    });

    test('should handle null avatar', () {
      const doctorSettings = DoctorSettings(
        id: 1,
        userId: 2,
        practice: 'Test Practice',
        aboutEn: 'Test About',
        education: 'Test Education',
        yearsExperience: 10,
        acceptingNewPatients: 1,
        supportedLanguages: ['English', 'Spanish'],
        countries: ['USA', 'Canada'],
      );

      const doctor = DoctorEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        consultationCount: 5,
        avatar: null,
        settings: doctorSettings,
      );

      expect(doctor.avatar, isNull);
    });

    test('should convert from JSON', () {
      final json = {
        'id': 1,
        'first_name': 'John',
        'last_name': 'Doe',
        'consultation_count': 5,
        'avatar': 'https://example.com/avatar.jpg',
        'doctor_settings': {
          'id': 1,
          'user_id': 2,
          'practice': 'Test Practice',
          'about_en': 'Test About',
          'education': 'Test Education',
          'years_experience': 10,
          'accepting_new_patients': 1,
          'supported_languages': ['English', 'Spanish'],
          'countries': ['USA', 'Canada'],
        },
      };

      final doctor = DoctorEntity.fromJson(json);

      expect(doctor.id, 1);
      expect(doctor.firstName, 'John');
      expect(doctor.lastName, 'Doe');
      expect(doctor.consultationCount, 5);
      expect(doctor.avatar, 'https://example.com/avatar.jpg');
      expect(doctor.settings.id, 1);
      expect(doctor.settings.userId, 2);
      expect(doctor.settings.practice, 'Test Practice');
      expect(doctor.settings.aboutEn, 'Test About');
      expect(doctor.settings.education, 'Test Education');
      expect(doctor.settings.yearsExperience, 10);
      expect(doctor.settings.acceptingNewPatients, 1);
      expect(doctor.settings.supportedLanguages, ['English', 'Spanish']);
      expect(doctor.settings.countries, ['USA', 'Canada']);
    });

    test('should convert to JSON', () {
      const doctorSettings = DoctorSettings(
        id: 1,
        userId: 2,
        practice: 'Test Practice',
        aboutEn: 'Test About',
        education: 'Test Education',
        yearsExperience: 10,
        acceptingNewPatients: 1,
        supportedLanguages: ['English', 'Spanish'],
        countries: ['USA', 'Canada'],
      );

      const doctor = DoctorEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        consultationCount: 5,
        avatar: 'https://example.com/avatar.jpg',
        settings: doctorSettings,
      );

      final json = doctor.toJson();

      expect(json['id'], 1);
      expect(json['first_name'], 'John');
      expect(json['last_name'], 'Doe');
      expect(json['consultation_count'], 5);
      expect(json['avatar'], 'https://example.com/avatar.jpg');
      expect(json['doctor_settings']['id'], 1);
      expect(json['doctor_settings']['user_id'], 2);
      expect(json['doctor_settings']['practice'], 'Test Practice');
      expect(json['doctor_settings']['about_en'], 'Test About');
      expect(json['doctor_settings']['education'], 'Test Education');
      expect(json['doctor_settings']['years_experience'], 10);
      expect(json['doctor_settings']['accepting_new_patients'], 1);
      expect(json['doctor_settings']['supported_languages'], ['English', 'Spanish']);
      expect(json['doctor_settings']['countries'], ['USA', 'Canada']);
    });
  });
}
