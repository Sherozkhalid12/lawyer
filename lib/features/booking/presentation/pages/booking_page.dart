import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/booking/presentation/widgets/booking_view.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BookingView(),
    );
  }
}

