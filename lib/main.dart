import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersignupwithauth/homscreen.dart';
import 'package:fluttersignupwithauth/registration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: SignIn(),
  ));
}

class SignIn extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignIn> {
  String result = "";

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            )),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Dite Guru",
                          style: TextStyle(fontSize: 65, color: Colors.white),
                        ),
                        Divider(
                          color: Colors.white,
                          indent: 80,
                          endIndent: 80,
                          thickness: 1,
                        ),
                        Text(
                          "Fill the below Information to Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: MediaQuery.of(context).size.height * .50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Center(
                                child: Text(
                                  "Login Account",
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 0, top: 15),
                              child: TextField(
                                controller: _email,
                                decoration: InputDecoration(
                                    hintText: 'Enter User Name'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 0, top: 4),
                              child: TextField(
                                controller: _password,
                                decoration:
                                    InputDecoration(hintText: 'Enter Password'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 17),
                              child: InkWell(
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Registration()));
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 50, right: 15, left: 15, bottom: 0),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blueAccent,
                                ),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "Login",
                                  ),
                                  color: Colors.blueAccent,
                                  onPressed: () {
                                    _register(_email.text.toString(),
                                        _password.text.toString());
                                  },
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 10,
                                height: 10,
                                child: Center(
                                  child: Text(
                                    result,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _register(String email, String password) async {
    var user = FirebaseAuth.instance.currentUser;

    try {

      dynamic result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (result != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      result = e.code;
    }
  }

}
