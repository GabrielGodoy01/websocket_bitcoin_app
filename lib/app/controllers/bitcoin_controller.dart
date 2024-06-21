import 'package:flutter/widgets.dart';
import 'package:flutter_mvc_template/app/models/bitcoin_model.dart';
import 'package:flutter_mvc_template/app/repositories/user/bitcoin_repository.dart';

class BitcoinController with ChangeNotifier {
  final BitcoinRepository _bitcoinRepository;

  BitcoinController(this._bitcoinRepository) {
    _bitcoinRepository.onDataReceived = (BitcoinModel data) {
      _bitcoinPrice = data.price;
      _addToPriceHistory(data);
      notifyListeners();
    };
  }

  String? _bitcoinPrice;
  String? get bitcoinPrice => _bitcoinPrice;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<BitcoinModel> priceHistory = [];
  final int _historyLength = 50;

  void _addToPriceHistory(BitcoinModel bitcoin) {
    priceHistory.add(bitcoin);
    if (priceHistory.length > _historyLength) {
      priceHistory.removeAt(0);
    }
  }
}
