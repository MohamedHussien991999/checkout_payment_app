import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkout_payment_app/Features/checkout/data/models/stripe_models/payment_intent_input_model.dart';
import 'package:checkout_payment_app/Features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());

  final CheckOutRepo checkOutRepo;

  Future<void> makePaymentStripe(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkOutRepo.makePaymentStripe(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
      (l) => emit(PaymentFailure(errMessage: l.errMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
