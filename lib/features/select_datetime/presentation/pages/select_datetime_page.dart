import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/select_datetime/presentation/widgets/select_datetime_view.dart';

class SelectDateTimePage extends StatelessWidget {
  const SelectDateTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SelectDateTimeView(),
    );
  }
}

