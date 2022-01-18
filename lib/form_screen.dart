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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // _formKey will help us get the value inside the field

  // Text Field Widget for the email
  Widget _buildEmail() { 
    return TextFormField(
      style: TextStyle(
        fontSize: 25.0,
        height: 2.0,
      ),
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) { 
        if (value!.isEmpty) { // check if the user didn't write anything inside the field  
          return 'Email is Required'; // error massage
        }

        if (!RegExp( // accept this format only : example@something.anything 
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address'; // error massage
        }

        return null; // this means there is no problem 
      },
      onSaved: (value) { // save the input email inside _email  
        _email = value!;
      },
    );
  }

  // Text Field Widget for the password
  Widget _buildPassword() {
    return TextFormField(
      style: TextStyle(
        fontSize: 25.0,
        height: 2.0,
      ),
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) { // check if the user didn't write anything inside the field 
          return 'Password is Required';  // error massage
        }
        if (value.length < 5) { // password have to be at least 5 characters
          return 'Password have to be more than 5 characters';  // error massage
        }

        return null; // this means there is no problem 
      },
      onSaved: (value) { // save the input password inside _password  
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
            autovalidateMode: AutovalidateMode.onUserInteraction, //show error massage without clicking on the button 
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  _buildEmail(),
                  _buildPassword(),
                  SizedBox(height: 60),
                  buttonForForm('Register', register), // this is a button 
                  SizedBox(height: 30),
                  buttonForForm('Log in', logIn),// this is a button
                ],
              ),
          ),
        ),
      ),
    );
  }

  //this is a button Widget 
  //it will take the name of the button and what action happens when you click on it 
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
    // if there is a problem with one of the field (like it's empty ), the function of the button will not work
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save(); // to save the written values in the field inside the variables _email, _password

    //since this is register, use variables _email and _password to send it to the database
    //this print statment just to check if the values are correct
    print(_email);
    print(_password);

    
  }

  
  logIn() {
    // if there is a problem with one of the field (like it's empty ), the function of the button will not work
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();// to save the written values in the field inside the variables _email, _password

    //since this is log in, use variables _email and _password for Authentication
    print(_email);
    print(_password);

    // this will navigate to the main page, it should only happens after Authentication  
    // put this inside if statment . if Authentication true , excute the statment below
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MainPage(),
      ),
    );

  }
}
