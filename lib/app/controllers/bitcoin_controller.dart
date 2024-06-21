import 'package:flutter/widgets.dart';
import 'package:flutter_mvc_template/app/models/bitcoin_model.dart';
import 'package:flutter_mvc_template/app/repositories/bitcoin_websocket.dart';

class BitcoinController with ChangeNotifier {
  final IBitcoinWebsocket _bitcoinRepository;

  BitcoinController(this._bitcoinRepository) {
    _bitcoinRepository.onDataReceived = (BitcoinModel data) {
      _bitcoinPrice = data.price;
      notifyListeners();
    };
  }

  String? _bitcoinPrice;
  String? get bitcoinPrice => _bitcoinPrice;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
}
