import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/features/doctorDetails/presentation/screens/doctor_details_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DoctorDetailsScreen.routeName:
        final doctorId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => DoctorDetailsScreen(doctorId: doctorId),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static void navigateToDoctorDetails(BuildContext context, int doctorId) {
    Navigator.of(context).pushNamed(
      DoctorDetailsScreen.routeName,
      arguments: doctorId,
    );
  }
}
