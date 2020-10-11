

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';




class Registration extends StatefulWidget {




_RegistrationState creatState()=>_RegistrationState();

  @override
  State<StatefulWidget> createState() {
   return _RegistrationState();
  }


  }



class _RegistrationState extends State<Registration> {

  FirebaseAuth _auth=FirebaseAuth.instance;




  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String n,e,p;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .80,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .50,
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
                                "Register Account",
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

                              decoration:
                              InputDecoration(hintText: 'Enter Name'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 0, top: 15),
                            child: TextField(
                              controller: emailController,
                              decoration:
                              InputDecoration(hintText: 'Enter Gmail'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 0, top: 4),
                            child: TextField(
                              controller: passwordController,
                              decoration:
                              InputDecoration(hintText: 'Enter Password'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 17),
                            child: InkWell(
                              child: Text(
                                "Did you forget Passowrd? Reset Here!",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onTap: () {
                                signUp();

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
                                  "Register",
                                ),
                                color: Colors.blueAccent,
                                onPressed: () {

                                  signUp();

                                },
                              ),
                            ),
                          ),
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
    );
  }
  Future<void> signUp( ) async{

    try{
      await _auth.createUserWithEmailAndPassword(email:emailController.text.toString(),password:passwordController.text.toString());


    }
   on FirebaseAuthException catch(e){
     print(e);
   }
  }

}