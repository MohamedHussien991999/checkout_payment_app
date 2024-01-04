import 'dart:developer';
import 'package:checkout_payment_app/Features/checkout/data/models/paypal_models/amount_model/amount_model.dart';
import 'package:checkout_payment_app/Features/checkout/data/models/paypal_models/amount_model/details.dart';
import 'package:checkout_payment_app/Features/checkout/data/models/paypal_models/item_list_model/item.dart';
import 'package:checkout_payment_app/Features/checkout/data/models/paypal_models/item_list_model/item_list_model.dart';
import 'package:checkout_payment_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_app/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PayPalService {
  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");


            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Payment Success'),
              ),
            );
            
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          ); 
          },
          onError: (error) {
            log("onError: $error");
        

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
              ),
            );
                Navigator.of(context).pop();
          },
          onCancel: () {
            log('cancelled:');
          
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Cancelled"),
              ),
            );
              Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
        total: "100",
        currency: 'USD',
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'));

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(orders: orders);
    return (amount: amount, itemList: itemList);
  }
}
