import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/appointment/presentation/widgets/appointment_view.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AppointmentView(),
    );
  }
}

