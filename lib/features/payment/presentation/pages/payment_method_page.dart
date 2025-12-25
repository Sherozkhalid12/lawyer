import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/payment/presentation/widgets/payment_method_view.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: PaymentMethodView(),
    );
  }
}

