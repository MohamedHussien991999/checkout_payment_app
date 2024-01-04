class PaymentIntentInputModel {
  final String amount;
  final String currency;
final String customerId;

  PaymentIntentInputModel(
      { required this.amount, required this.customerId,required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
    'customer': customerId
    };
  }
}
