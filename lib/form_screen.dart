import 'package:flutter/material.dart';
import 'package:flutter_movie_app/main_page.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _email = '';
  String _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      style: TextStyle(
        fontSize: 25.0,
        height: 2.0,
      ),
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      style: TextStyle(
        fontSize: 25.0,
        height: 2.0,
      ),
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }
        if (value.length < 5) {
          return 'Password have to be more than 5 characters';
        }

        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  _buildEmail(),
                  _buildPassword(),
                  SizedBox(height: 60),
                  buttonForForm('Register', register),
                  SizedBox(height: 30),
                  buttonForForm('Log in', logIn),
                ],
              ),
          ),
        ),
      ),
    );
  }

  buttonForForm(nameOfButton, pressFunctionAction) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            minWidth: double.infinity,
            height: 60.0,
            child: RaisedButton(
              child: Text(
                nameOfButton,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              onPressed: pressFunctionAction,
            ),
          ),
        );
  }

  register() {
    if (!_formKey.currentState!.validate()) {
      // if there is a problem with one of the field (like it's empty ), the function of the button will not work
      return;
    }

    _formKey.currentState!
        .save(); // to save the written values in the field inside the variables _email, _password

    //since this is register, use variables _email and _password to send it to the database
    //this print statment just to check if the values are correct
    print(_email);
    print(_password);

    // if (true) { //failed to add SnackBar
    //   snackBarMsg(context);
    // }
  }

  // snackBarMsg(BuildContext context) { //failed to add SnackBar
  //   final snackMassage = SnackBar(
  //     content: Text('Hey! This is a SnackBar message.'),
  //     duration: Duration(seconds: 5),
  //   );
  //   Scaffold.of(context).showSnackBar(snackMassage);
  // }

  logIn() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    print(_email);
    print(_password);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MainPage(),
      ),
    );

    //Send to API
  }
}
