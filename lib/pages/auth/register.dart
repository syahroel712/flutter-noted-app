import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_noted_app/api/api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Api api = Api();
  bool pengecekan = true;
  void checkPassword() {
    setState(() {
      pengecekan = !pengecekan;
    });
  }

  var _name = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();

  void register() async {
    final res = await http.post(Uri.parse(Api.url + 'api/register'), body: {
      'name': _name.text,
      'email': _email.text,
      'password': _password.text,
    });
    var data = jsonDecode(res.body);
    if (res.statusCode == 201) {
      showToast(data['message']);
    } else if (res.statusCode == 422) {
      if (_name.text == '') {
        showToast(data['data']['name'][0]);
      }

      if (_email.text == '') {
        showToast(data['data']['email'][0]);
      } else if (data['data']['email'][0] != '') {
        showToast(data['data']['email'][0]);
      }

      if (_password.text == '') {
        showToast(data['data']['password'][0]);
      }
    }
  }

  showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 8,
              ),
              height: 90,
              width: MediaQuery.of(context).size.width / 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Poppins-Bold',
                      ),
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Sign up to get started!',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Poppins-Regular',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3.5,
              ),
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width / 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: TextFormField(
                        controller: _name,
                        decoration: new InputDecoration(
                          labelText: "Enter Name",
                          fillColor: Color(0xFF39A2DB),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFF39A2DB),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFF39A2DB),
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: TextFormField(
                        controller: _email,
                        decoration: new InputDecoration(
                          labelText: "Enter Email",
                          fillColor: Color(0xFF39A2DB),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFF39A2DB),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFF39A2DB),
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: TextFormField(
                        obscureText: pengecekan,
                        controller: _password,
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                          fillColor: Color(0xFF39A2DB),
                          suffixIcon: IconButton(
                            icon: Icon(
                              pengecekan
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              checkPassword();
                            },
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFF39A2DB),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFF39A2DB),
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                      child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            register();
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Regular',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF39A2DB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'or register with',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF39A2DB),
                                width: 1,
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Image.asset('images/icons/google.png'),
                              iconSize: 40,
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF39A2DB),
                                width: 1,
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Image.asset('images/icons/facebook.png'),
                              iconSize: 40,
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF39A2DB),
                                width: 1,
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Image.asset('images/icons/twitter.png'),
                              iconSize: 40,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 1.1,
              ),
              height: 50,
              width: MediaQuery.of(context).size.width / 1,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    'I already have an account, SIGN IN',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
