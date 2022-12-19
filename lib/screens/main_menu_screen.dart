import 'package:flutter/material.dart';
import 'package:tictactoe_flutter/responsive/responsive.dart';
import 'package:tictactoe_flutter/screens/create_room_screen.dart';
import 'package:tictactoe_flutter/screens/join_room_screen.dart';
import 'package:tictactoe_flutter/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () => createRoom(context),
              text: 'Create Room',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () => joinRoom(context),
              text: 'Join Room',
            )
          ],
        ),
      ),
    );
  }
}
