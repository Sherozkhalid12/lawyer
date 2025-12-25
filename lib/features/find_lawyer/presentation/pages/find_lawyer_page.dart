import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/find_lawyer/presentation/widgets/find_lawyer_view.dart';

class FindLawyerPage extends StatelessWidget {
  const FindLawyerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: FindLawyerView(),
    );
  }
}

