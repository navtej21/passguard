import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:password_generator/screen/fingerprint_authentication.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'PassGuard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const Icon(
          Icons.lock,
          size: 190,
        ),
        Container(
            child: const Text(
          'Please Authenticate Before Moving Forward!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        )),
        ElevatedButton(
            onPressed: () {
              authenticate(context);
            },
            child: Text('Authenticate'))
      ],
    )));
  }
}
