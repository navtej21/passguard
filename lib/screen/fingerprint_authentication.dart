import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:password_generator/screen/home_screen.dart';
import 'package:password_generator/screen/password_screen.dart';

Future<void> authenticate(BuildContext context) async {
  final LocalAuthentication auth = LocalAuthentication();
  bool isauthenticated = false;
  try {
    isauthenticated = await auth.authenticate(
      localizedReason: 'authenticate',
      options: AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: false,
        useErrorDialogs: true,
      ),
    );
  } catch (error) {
    print('error during biometric authentication: $error');
  }

  if (isauthenticated) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return PassWrodScreen();
      }),
    );
  } else {
    print('Biometric authentication failed');
  }
}
