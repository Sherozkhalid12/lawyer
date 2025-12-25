import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/payment/presentation/widgets/add_new_card_view.dart';

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AddNewCardView(),
    );
  }
}

