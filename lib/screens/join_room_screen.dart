import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textField.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                  text: 'Join Room',
                  fontSize: 70),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your nick name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _gameIdController,
                hintText: 'Enter gameId',
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomButton(onTap: () {}, text: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}
