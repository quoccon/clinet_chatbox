import 'package:chatbox/models/AuthUser.dart';
import 'package:chatbox/screen/widget/call/call_screen.dart';
import 'package:chatbox/screen/widget/contacts/contacts_screen.dart';
import 'package:chatbox/screen/widget/home/home_screen.dart';
import 'package:chatbox/screen/widget/setting/settings_screen.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? Image.asset("assets/images/Message.png")
                  : Image.asset("assets/images/Message-outline.png"),
              label: "Message"),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset("assets/images/Call-outline.png")
                : Image.asset("assets/images/Call.png"),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset("assets/images/user-outline.png")
                : Image.asset("assets/images/user.png"),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Image.asset("assets/images/settings-outline.png")
                : Image.asset("assets/images/settings.png"),
            label: 'Setting',
          ),
        ],
        selectedItemColor: const Color(0xff24786d),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CallScreen();
      case 2:
        return const ContactScreen();
      case 3:
        return const SettingScreen();
      default:
        return const Center(
          child: Text('Error'),
        );
    }
  }
}
