class PaymentMethodModel {
  const PaymentMethodModel({
  required this.image,
  required this.name,
  });

  final String image;
  final String name;

  static PaymentMethodModel empty() => const PaymentMethodModel(image: "", name: "");
}

