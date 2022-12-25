import 'package:flutter/material.dart';
import 'package:tictactoe_flutter/screens/create_room_screen.dart';
import 'package:tictactoe_flutter/screens/game_screen.dart';
import 'package:tictactoe_flutter/screens/join_room_screen.dart';
import 'package:tictactoe_flutter/screens/main_menu_screen.dart';
import 'package:tictactoe_flutter/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
