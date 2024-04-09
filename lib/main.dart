import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:password_generator/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    home: HomeScreen(),
  ));
}
