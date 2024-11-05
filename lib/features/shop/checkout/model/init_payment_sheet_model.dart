import 'package:t_store/features/shop/checkout/model/payment_intent_input_model.dart';

class InitPaymentSheetModel {
  const InitPaymentSheetModel({
    required this.stripeCustomerId,
    required this.ephemeralKey,
    required this.paymentIntentClientSecret,
    required this.paymentIntentInputModel,
    this.isGooglePay = false,
  });
  final String stripeCustomerId;
  final String ephemeralKey;
  final String paymentIntentClientSecret;
  final PaymentIntentInputModel paymentIntentInputModel;
  final bool isGooglePay;
}
