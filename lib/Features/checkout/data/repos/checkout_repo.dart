import 'package:checkout_payment_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
