import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          leading: Image.asset("assets/images/search.png"),
          backgroundColor: Colors.black,
          title: const Text("Contact",style: TextStyle(color: Colors.white),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child:  Image.asset("assets/images/user-add.png"),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,

            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Container(decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)
                  )
              ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

              ),
            )
          ],
        )
    );
  }
}
