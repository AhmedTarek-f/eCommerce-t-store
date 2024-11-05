class AutomaticPaymentMethods {
  AutomaticPaymentMethods({
    this.enabled,});

  bool? enabled;

  AutomaticPaymentMethods.fromJson(dynamic json) {
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    return map;
  }

}