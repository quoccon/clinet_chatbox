import 'package:chatbox/screen/widget/setting/widgets/add_friends.dart';
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
          backgroundColor: const Color(0xff1E1E1E),
          title: const Text("Contact",style: TextStyle(color: Colors.white),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child:  GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFriend()));
                },
                child: Image.asset("assets/images/user-add.png"),
              )
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xff1E1E1E),

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
