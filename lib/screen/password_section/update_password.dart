import 'package:flutter/material.dart';
import 'package:password_generator/screen/datamodel/data.dart';
import 'package:password_generator/screen/password_section/password_generation.dart';
import 'package:password_generator/screen/password_section/password_screen.dart';

class UpdatePassword extends StatefulWidget {
  UpdatePassword({
    Key? key,
    required this.appname,
    required this.username,
    required this.password,
  }) : super(key: key);

  final String appname;
  final String username;
  final String password;

  @override
  State<UpdatePassword> createState() => _UpdatePasswordListState();
}

List<user> users2 = [];
late String x;
late String y;
late String z;

class _UpdatePasswordListState extends State<UpdatePassword> {
  @override
  void initState() {
    super.initState();
    x = widget.appname;
    y = widget.username;
    z = widget.password;
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Password',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    initialValue: x,
                    decoration: InputDecoration(
                      labelText: 'App or Site Name',
                      hintText: 'App or Site Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.info),
                      helperText:
                          'The Site/App which you are going to store the password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter App/Site Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    initialValue: y,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                      helperText:
                          'Enter The Username/Id Which you use in that app',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The Username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    initialValue: z,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      hintText: 'Password',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      helperText:
                          'Enter the current password for the site/app.',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        bool exists =
                            users2.any((element) => element.appsitename == x);
                        if (exists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('App or Site Name already exists'),
                            ),
                          );
                        } else {
                          users2.add(user(x, y, z));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PassWrodScreen(
                              users: users2,
                            );
                          }));
                        }
                      }
                    },
                    child: Text('Update Password'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
