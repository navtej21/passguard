import 'package:flutter/material.dart';

Widget password = TextFormField(
    decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        label: Text('Password'),
        border: OutlineInputBorder()));
