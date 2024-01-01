import 'package:checkout_payment_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_app/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payment_app/core/utils/api_keys.dart';
import 'package:checkout_payment_app/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel)async {
   var response=await apiService.post(
    body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey
    );
  var paymentIntentModel=PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }
}
