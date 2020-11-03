import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bsrb/helper/constants.dart';

import 'package:bsrb/home/login_view.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  String title = 'Snackbar';

  TextEditingController norekInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();
  TextEditingController namaInput = new TextEditingController();
  TextEditingController alamatInput = new TextEditingController();
  TextEditingController notelInput = new TextEditingController();

  void addData() {
    var url = "http://bsrb.000webhostapp.com/register.php";

    http.post(url, body: {
      "norek": norekInput.text,
      "password": passwordInput.text,
      "nama": namaInput.text,
      "alamat": alamatInput.text,
      "notel": notelInput.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        title: Text("BSRB MOBILE"),
      ),
      body: Container(
        color: Colors.white,
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
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "REGISTRASI",
          style: TextStyle(
            color: Colors.black,
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
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: norekInput,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: ColorPalette.underlineTextField,
                    width: 1.5,
                  )),
                  labelText: "Nomer Rekening",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Nomer Rekening",
                  hintStyle: TextStyle(color: ColorPalette.hintColor),
                ),
                style: TextStyle(color: Colors.black, fontSize: 18.0),
                autofocus: false,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Nomer Rekening is Empty";
                  }
                  return null;
                },
              ),
              TextFormField(
                  controller: passwordInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorPalette.underlineTextField,
                      width: 1.5,
                    )),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Password",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Password is Empty";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: namaInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorPalette.underlineTextField,
                      width: 1.5,
                    )),
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Nama",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Nama is Empty";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: alamatInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorPalette.underlineTextField,
                      width: 1.5,
                    )),
                    labelText: "Alamat",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Alamat",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Alamat is Empty";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: notelInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorPalette.underlineTextField,
                      width: 1.5,
                    )),
                    labelText: "Nomer Telephone",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Nomer Telephone",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Nomer Telephone is Empty";
                    }
                    return null;
                  }),
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
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              "Register",
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
            _popupDialog(context);
          },
        ),
      ],
    );
  }

  void _popupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Apakah Data Sudah Benar?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Belum"),
            ),
            FlatButton(
              onPressed: () {
                addData();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Sudah"),
            ),
          ],
        );
      },
    );
  }
}
