import 'package:checkout_payment_app/Features/checkout/data/models/stripe_models/payment_intent_input_model.dart';
import 'package:checkout_payment_app/Features/checkout/data/repos/checkout_repo.dart';
import 'package:checkout_payment_app/core/errors/failures.dart';
import 'package:checkout_payment_app/core/utils/paypal_service.dart';
import 'package:checkout_payment_app/core/utils/stripe_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class CheckoutRepoImpl implements CheckOutRepo {
  final StripeService stripeService = StripeService();
  final PayPalService payPalService = PayPalService();

  @override
  Future<Either<Failure, void>> makePaymentStripe(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
 void makePaymentPaypal({
    required BuildContext context,
  })  {
      var transactionData = payPalService.getTransactionData();

      payPalService.executePaypalPayment(context, transactionData);
  }
}
