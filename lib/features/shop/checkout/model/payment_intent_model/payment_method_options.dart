import 'package:t_store/features/shop/checkout/model/payment_intent_model/card.dart';
import 'package:t_store/features/shop/checkout/model/payment_intent_model/link.dart';

class PaymentMethodOptions {
  PaymentMethodOptions({
    this.card,
    this.link,
  });

  Card? card;
  Link? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (card != null) {
      map['card'] = card?.toJson();
    }
    if (link != null) {
      map['link'] = link?.toJson();
    }
    return map;
  }

  PaymentMethodOptions.fromJson(dynamic json) {
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }

}