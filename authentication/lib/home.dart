import 'package:authentication/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // sign user out method
  final user = FirebaseAuth.instance.currentUser!;

// sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    FirebaseServices().googleSignOut();
  }
  // void signUserOut(context) async {
  //   await FirebaseAuth.instance.signOut().then((_) {
  //     print('success logging out');
  //     Navigator.of(context).pushReplacement(
  //         new MaterialPageRoute(builder: (BuildContext context) {
  //       return new LoginPage();
  //     })).catchError((e) {
  //       print('failure logging out');
  //       print(e);
  //     });
  //     FirebaseServices().googleSignOut();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
          child: Text(
        "LOGGED IN AS: " + user.email!,
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
