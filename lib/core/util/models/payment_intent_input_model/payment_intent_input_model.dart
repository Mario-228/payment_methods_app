class PaymentIntentInputModel {
  String amount;
  String currency;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() => {'amount': amount, 'currency': currency};
}
