import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final fb;

  const HomePage({Key key, this.fb}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> lists = [];

  final dbRef = FirebaseDatabase().reference().child("user");

  @override
  void initState() {
    super.initState();

    dbRef.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names

      print(snap.value.keys);
      print(snap.value);
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;

      for (var individualKey in KEYS) {
        Users users = new Users(
          DATA[individualKey]['name'],
          DATA[individualKey]['email'],
          DATA[individualKey]['password'],
        );

        lists.add(users);
        print(
            "aaaaaaaaaaaaaaaaaakkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkaaaaaaaaaaaaaa");

        setState(() {
          print("here i am");
          print('Length: ${lists.length}');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
          child: lists.length != 0
              ? ListView.builder(
                  itemCount: lists.length,
                  itemBuilder: (_, index) {
                    return UsersUI(lists[index].name, lists[index].email,
                        lists[index].password, index);
                  },
                )
              : Text(
                  "No Users Registered!",
                  style: TextStyle(fontSize: 24.0),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.login,
          color: Colors.white,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UsersUI(String name, String email, String password, var index) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
            ),
            Text(
              password,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      dbRef.child(name).remove();
                      setState(() {
                        lists = List.from(lists)..removeAt(index);
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))),
          ],
        ),
      ),
    );
  }
}

class Users {
  String name, email, password;

  Users(this.name, this.email, this.password);
}

class Xyyy extends StatefulWidget {
  @override
  _XyyyState createState() => _XyyyState();
}

class _XyyyState extends State<Xyyy> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
