class PaymentIntentInputModel {
  const PaymentIntentInputModel({
    required this.currency,
    required this.amount,
    required this.customerId,
  });
  final int amount;
  final String currency;
  final String customerId;

  Map<String,dynamic> toJson(){
    return {
      "amount":amount*100,
      "currency":currency,
      "customer":customerId,
    };
  }

}