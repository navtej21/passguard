import 'package:flutter/material.dart';
import 'package:password_generator/screen/fingerprint_authentication.dart';
import 'package:password_generator/screen/password_generation.dart';

class PassWrodScreen extends StatefulWidget {
  const PassWrodScreen({Key? key}) : super(key: key);

  @override
  State<PassWrodScreen> createState() => _PassWrodScreenState();
}

class _PassWrodScreenState extends State<PassWrodScreen> {
  List<Map<String, String>> password = [];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
            Spacer(), // This will fill the available space between the icons
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasswordList()));
            },
            icon: Icon(Icons.add),
            label: Text('Add New Password')),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // half of width or height to make it circular
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2, // Border width
                ),
                color: Colors.redAccent,
              ),
              child: const Center(
                child: Text(
                  "Create, securely store, and meticulously maintain your passwords for utmost security.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
