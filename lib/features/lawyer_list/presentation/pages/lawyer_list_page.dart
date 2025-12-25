import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/lawyer_list/presentation/widgets/lawyer_list_view.dart';

class LawyerListPage extends StatelessWidget {
  final String title;

  const LawyerListPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LawyerListView(title: title),
    );
  }
}

