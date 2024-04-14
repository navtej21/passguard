import 'package:flutter/material.dart';
import 'package:password_generator/screen/datamodel/data.dart';
import 'package:password_generator/screen/password_section/password_screen.dart';
import 'package:password_generator/screen/password_section/update_password.dart';

class PassWrodScreen extends StatefulWidget {
  PassWrodScreen({Key? key, required this.users}) : super(key: key);
  final List<user> users;

  @override
  State<PassWrodScreen> createState() => _PassWrodScreenState();
}

class _PassWrodScreenState extends State<PassWrodScreen> {
  List<user> lst = [];

  @override
  void initState() {
    super.initState();
    lst = widget.users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordList(),
            ),
          );
        },
        icon: Icon(Icons.add),
        label: Text('Add New Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                color: Colors.redAccent,
              ),
              child: const Center(
                child: Text(
                  "Securely store, and meticulously maintain your passwords for utmost security.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.greenAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                          lst[index].appsitename,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdatePassword()));
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (lst.isEmpty) {
                                    Container(
                                      child: Text(
                                          'There are no passwords stored!!'),
                                    );
                                  } else {
                                    setState(() {
                                      lst.removeAt(index);
                                    });
                                  }
                                });
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.copy_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: lst.length,
            ),
          ),
        ],
      ),
    );
  }
}
