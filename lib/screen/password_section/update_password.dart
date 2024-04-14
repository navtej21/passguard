import 'package:flutter/material.dart';
import 'package:password_generator/screen/datamodel/data.dart';
import 'package:password_generator/screen/password_section/password_generation.dart';

class UpdatePassword extends StatefulWidget {
  UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordListState();
}

List<user> users2 = [];

class _UpdatePasswordListState extends State<UpdatePassword> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String appname = "";
    String usernames = "";
    String password = "";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Password',
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
                    decoration: const InputDecoration(
                      labelText: 'App or Site Name',
                      hintText: 'App or Site Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.info),
                      helperText:
                          'The Site/App which you are going to store the password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The App Name or Site Name';
                      } else {
                        appname = value;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                      helperText:
                          'Enter The Username/Id Which you use in that app',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      } else {
                        usernames = value;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          label: Text('Password'),
                          border: OutlineInputBorder(),
                          helperText:
                              'Enter the current password for the site/app.'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter The Password';
                        } else {
                          password = value;
                        }
                        return null;
                      }),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        bool exists = users2
                            .any((element) => element.appsitename == appname);
                        if (exists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('App or Site Name already exists')),
                          );
                        } else {
                          users2.add(user(appname, usernames, password));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PassWrodScreen(
                              users: users2,
                            );
                          }));
                        }
                      }
                    },
                    child: Text('Update  Password'),
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
