import 'package:chatbox/screen/auth/login_screen.dart';
import 'package:chatbox/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color(0xff1e1e1e),
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset("assets/images/Logo-uihut.png"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Connect \nfriends",
                    style: TextStyle(fontSize: 65, color: Colors.white),
                  ),
                  const Text(
                    "easily & \nquickly",
                    style: TextStyle(
                        fontSize: 65,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Our chat apps is the perfect way to stay\nconnected with friends and family",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      width: 400,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Sign up with mail",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                   Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Existing account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                          child:const Text(
                            "Log in",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
