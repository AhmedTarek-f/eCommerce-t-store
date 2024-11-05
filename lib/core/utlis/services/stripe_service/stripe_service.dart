import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:t_store/core/utlis/services/api_service/api_keys.dart';
import 'package:t_store/core/utlis/services/api_service/api_service.dart';
import 'package:t_store/features/shop/checkout/model/init_payment_sheet_model.dart';
import 'package:t_store/features/shop/checkout/model/payment_intent_input_model.dart';
import 'package:t_store/features/shop/checkout/model/payment_intent_model/payment_intent_model.dart';
import 'package:t_store/features/shop/checkout/model/ephemeral_key_model/ephemeral_key_model.dart';

class StripeService {
  final APIService apiService = APIService();

  Future<String> createStripeCustomer({required String userName , required String email}) async {
    try{
      var response = await apiService.post(
          body: {"name": userName, "email": email},
          url: "https://api.stripe.com/v1/customers",
          token: APIKeys.secretKey,
          contentType: Headers.formUrlEncodedContentType);
      return response.data!["id"];
    }
    catch(e) {
      throw "Something went wrong, Please try again";
    }
  }

  Future<EphemeralKeyModel> createEphemeralKeyForCustomer({required String userStripeId}) async {
    try{
      var response = await apiService.post(
        body: {
          "customer": userStripeId,
        },
        url: "https://api.stripe.com/v1/ephemeral_keys",
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': 'Bearer ${APIKeys.secretKey}',
          'Stripe-Version': '2024-06-20',
        },
      );
      final EphemeralKeyModel ephemeralKeyModel =
          EphemeralKeyModel.fromJson(response.data!);
      return ephemeralKeyModel;
    }
    catch(e) {
      throw "Something went wrong, Please try again";
    }
  }

  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async{
    try{
      var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: APIKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType
      );
      final PaymentIntentModel paymentIntentResponse = PaymentIntentModel.fromJson(response.data);
      return paymentIntentResponse;
      }
      catch(e) {
        throw "Something went wrong, Please try again";
      }
    }
  Future<void> initPaymentSheet({required InitPaymentSheetModel initPaymentSheetModel}) async{
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheetModel.paymentIntentClientSecret,
          merchantDisplayName: "T-Store",
          googlePay:initPaymentSheetModel.isGooglePay?
          PaymentSheetGooglePay(
            amount:initPaymentSheetModel.paymentIntentInputModel.amount.toString(),
            currencyCode:initPaymentSheetModel.paymentIntentInputModel.currency ,
            merchantCountryCode: "T-Store",
            testEnv: true,
          ):null,
          customerId: initPaymentSheetModel.stripeCustomerId,
          customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKey,
        ),
    );
  }

  Future<void> displayPaymentSheet() async{
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    bool isGooglePay = false,
  }) async {
    try{
      final PaymentIntentModel paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
      final EphemeralKeyModel ephemeralKeyModel = await createEphemeralKeyForCustomer(userStripeId:paymentIntentInputModel.customerId);
      await initPaymentSheet(
          initPaymentSheetModel: InitPaymentSheetModel(
              stripeCustomerId: paymentIntentInputModel.customerId,
              ephemeralKey: ephemeralKeyModel.secret!,
              paymentIntentClientSecret: paymentIntentModel.clientSecret!,
              paymentIntentInputModel: paymentIntentInputModel
          ),
      );
      await displayPaymentSheet();
    }
    on StripeException catch(e){
      if(e.error.code.name == "Canceled"){
        throw e.error.message.toString();
      }
    }
    catch(e)
    {
      throw e.toString();
    }
  }
}