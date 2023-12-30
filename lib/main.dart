import 'package:checkout_payment_app/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  //Stripe.publishableKey = ApiKeys.puplishableKey;

  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// PaymentIntentModel create payment intent(amount , currency , customerId)
// keySecret createEphemeralKey( customerId)
// initPaymentSheet (merchantDisplayName , intentClientSecret , ephemeralKeySecret)
// presentPaymentSheet()
