import 'package:flutter/material.dart';
import 'package:carpooladmin/services/auth.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email = '';
  String password = '';
  String err = '';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.lightBlue, Colors.red]
              ),
            ),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to Carpool Admin',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )
              ),
              SizedBox(height: 20.0),
              // email field
              TextFormField(
                validator: (val) => val.isNotEmpty && val.contains('@') ? null : 'Please enter a valid email address',
                decoration: InputDecoration(
                  labelText: 'email',
                  icon: Icon(Icons.email)
                ),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              // password field
              TextFormField(
                validator: (val) => val.isNotEmpty ? null : 'Please enter a password',
                decoration: InputDecoration(
                  labelText: 'password',
                  icon: Icon(Icons.vpn_key)
                ),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              // sign in button
              RaisedButton(
                color: Colors.black,
                child: Text(
                  'sign in',
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInService(email, password);
                      if (result == null) {
                        setState(() => err = 'Sign in error. please enter a valid email/password. If you have not received credentials, please contact the developer.');
                      }
                    }
                  }
              ),
              SizedBox(height: 15.0),
              Text(
                err,
                style: TextStyle(color: Colors.black, fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}