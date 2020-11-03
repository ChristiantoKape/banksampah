import 'dart:convert';
import 'package:bsrb/home/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bsrb/helper/constants.dart';

import 'package:bsrb/admin/admin_list.dart';
import 'package:bsrb/user/user_view.dart';

import 'package:bsrb/home/register_.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  String norek, password, status;

  String alert = "Ready to Logon";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController norekInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();

  //method login process
  void _login() async {
    if (_formKey.currentState.validate()) {
      final response = await http.post(
          "http://bsrb.000webhostapp.com/login.php",
          body: {"norek": norekInput.text, "password": passwordInput.text});

      var dataUser = json.decode(response.body);

      if (dataUser.length < 1) {
        // if data user is empty or 0
        setState(() {
          alert = "You can't login";
        });
      } else {
        setState(() {
          norek = dataUser[0]["norek"];
          password = dataUser[0]["password"];
          status = dataUser[0]["status"];
        });

        if (status == "admin") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Admin(
                        norek: norek,
                      )));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => User(
                        norek: norek,
                      )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50.0),
        ),
        Text(
          "TABUNGAN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        Text(
          "BANK SAMPAH",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        Text(
          "RESIK BECIK SEMARANG",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.0),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: norekInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.underlineTextField,
                        width: 2.0,
                      ),
                    ),
                    labelText: "Nomer Rekening",
                    labelStyle: TextStyle(color: ColorPalette.hintColor),
                    hintText: "Nomer Rekening",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Nomer Rekening is Empty";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: passwordInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.underlineTextField,
                        width: 2.0,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: ColorPalette.hintColor),
                    hintText: "Password",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Password Is Empty";
                    }
                    return null;
                  },
                  obscureText: true)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            width: double.infinity,
            child: Text(
              "Login",
              style:
                  TextStyle(color: ColorPalette.primaryColor, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onTap: () {
            _login();
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "or",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        FlatButton(
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RegisterPage()));
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Text(
                "Lupa Password ? Click Here",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            )
          ],
        )
      ],
    );
  }
}
