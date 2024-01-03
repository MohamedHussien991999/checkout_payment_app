import 'package:checkout_payment_app/Features/checkout/presentation/views/widgets/my_cart_view_widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_payment_app/Features/checkout/presentation/views/widgets/payment_details_view_widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
              // updatePaymentMethod: updatePaymentMethod,
              ),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(),
         
        ],
      ),
    );
  }
}

