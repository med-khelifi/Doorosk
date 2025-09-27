import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class PaymentTap extends StatelessWidget {
  const PaymentTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Payment",
        style: TextStyle(color: ColorsManager.whiteColor),
      ),
    );
  }
}
