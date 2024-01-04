
import 'package:checkout_payment_app/Features/checkout/data/models/stripe_models/payment_intent_input_model.dart';
import 'package:checkout_payment_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePaymentStripe(
      {required PaymentIntentInputModel paymentIntentInputModel});
 void makePaymentPaypal({
    required BuildContext context,
  }) ;
}
