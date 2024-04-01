class FrankfurterLatestModel {
  FrankfurterLatestModel({
    required this.amount,
    required this.base,
    required this.date,
    required this.rates,
  });
  double amount;
  String base;
  String date;
  Map<String, dynamic> rates;

  factory FrankfurterLatestModel.fromJson(Map<String, dynamic> json) {
    return FrankfurterLatestModel(
      amount: json['amount'],
      base: json['base'],
      date: json['date'],
      rates: json['rates'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['base'] = base;
    _data['date'] = date;
    _data['rates'] = rates;
    return _data;
  }
}
