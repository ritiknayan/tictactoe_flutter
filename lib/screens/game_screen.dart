import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_flutter/resources/socket_methods.dart';
import 'package:tictactoe_flutter/views/waiting_lobby.dart';

import '../provider/room_data_provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}


class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
  
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }
  @override
  Widget build(BuildContext context) {

    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    // print(Provider.of<RoomDataProvider>(context).player1..socketID);
    // print(Provider.of<RoomDataProvider>(context).player2..socketID);
    //  Provider.of<RoomDataProvider>(context).roomData.toString();
    return Scaffold(
      body: roomDataProvider.roomData['isJoin'] ? const WaitingLobby() : Center(
        child: Text(
          Provider.of<RoomDataProvider>(context).roomData.toString(),
        ),
      ),
    );
  }
}
