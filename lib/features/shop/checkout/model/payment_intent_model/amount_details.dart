class AmountDetails {
  AmountDetails({
    this.tip,});

  dynamic tip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tip'] = tip;
    return map;
  }

  AmountDetails.fromJson(dynamic json) {
    tip = json['tip'];
  }

}