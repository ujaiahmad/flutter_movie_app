import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: "Email"),
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Password"),
                      obscureText: true,
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                    RaisedButton(
                        child: Text("Sign Up"),
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              print('Account already exists for that email');
                            }
                          } catch (e) {
                            print(e);
                          }
                        })
                  ])),
        ));
  }
}
