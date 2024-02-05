import 'dart:developer';
import 'package:checkout_payment_app/Features/checkout/data/models/stripe_models/payment_intent_input_model.dart';
import 'package:checkout_payment_app/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_payment_app/Features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:checkout_payment_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });
  final bool isPaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Payment Success'),
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          log(state.errMessage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            if (isPaypal) {
              CheckoutRepoImpl checkOutRepo =CheckoutRepoImpl();
              checkOutRepo.makePaymentPaypal(context: context);
              
            } else {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: "100",
                currency: 'usd',
                customerId: 'cus_PJ1gKJsCnNMPyZ',
              );
              BlocProvider.of<PaymentCubit>(context).makePaymentStripe(
                  paymentIntentInputModel: paymentIntentInputModel);
            }
          },
          text: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
