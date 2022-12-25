import 'package:flutter/material.dart';
import 'package:tictactoe_flutter/resources/socket_client.dart';
import 'package:tictactoe_flutter/screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
   
    if (nickname.isNotEmpty) {
      
       print(nickname);
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      print(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
