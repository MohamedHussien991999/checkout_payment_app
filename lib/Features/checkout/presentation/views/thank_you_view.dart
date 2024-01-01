import 'package:checkout_payment_app/Features/checkout/presentation/views/widgets/thank_you_view_widgets/thank_you_view_body.dart';
import 'package:checkout_payment_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}
