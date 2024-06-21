import 'dart:convert';

import 'package:flutter_mvc_template/app/models/bitcoin_model.dart';
import 'package:flutter_mvc_template/app/repositories/bitcoin_websocket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BitcoinWebsocketImpl implements IBitcoinWebsocket {
  final WebSocketChannel channel;
  @override
  Function(BitcoinModel)? onDataReceived;

  BitcoinWebsocketImpl(String url)
      : channel = WebSocketChannel.connect(Uri.parse(url)) {
    channel.stream.listen((message) {
      Map data = jsonDecode(message);
      if (onDataReceived != null) {
        onDataReceived!(BitcoinModel(price: data['p'], date: DateTime.now()));
      }
    });
  }
}
