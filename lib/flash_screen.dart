import 'package:chatbox/welcome_screen.dart';
import 'package:flutter/material.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(seconds: 2);
    Future.delayed(duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen()
        )
      );
    });


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Subtract.png"),
            const Text("Chatbox",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}