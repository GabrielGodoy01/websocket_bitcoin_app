class BitcoinModel {
  final String price;
  final DateTime date;

  const BitcoinModel({required this.price, required this.date});

  factory BitcoinModel.fromJson(Map<String, dynamic> json) {
    return BitcoinModel(
      price: json['p'],
      date: DateTime.now(),
    );
  }
}
