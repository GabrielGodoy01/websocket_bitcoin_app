import 'dart:convert';

import 'package:flutter_mvc_template/app/models/bitcoin_model.dart';
import 'package:flutter_mvc_template/app/repositories/user/bitcoin_repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BitcoinRepositoryWebsocket implements BitcoinRepository {
  final WebSocketChannel channel;
  @override
  Function(BitcoinModel)? onDataReceived;

  BitcoinRepositoryWebsocket(String url)
      : channel = WebSocketChannel.connect(Uri.parse(url)) {
    channel.stream.listen((message) {
      Map data = jsonDecode(message);
      if (onDataReceived != null) {
        onDataReceived!(BitcoinModel(price: data['p'], date: DateTime.now()));
      }
    });
  }
}
