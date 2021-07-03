import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool pengecekan = true;
  void checkPassword() {
    setState(() {
      pengecekan = !pengecekan;
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  var _username = TextEditingController();
  var _password = TextEditingController();

  void login() async {
    final res = await http
        .post('http://noted-app.jualfotocopypadang.com/login.php', body: {
      'username': _username.text,
      'password': _password.text,
    });

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      var pesan = data['success'];
      var userId = data['user_id'];
      var userNama = data['user_nama'];
      // showToast(pesan);

      if(userId != null){
        savePref(pesan, userId, userNama);
        showToast('Selamat Datang');
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        showToast('Username atau password salah');
        _username.clear();
        _password.clear();
      }
    }
  }

  savePref(String pesan, String userId, String userNama) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('pesan', pesan);
    preferences.setString('user_id', userId);
    preferences.setString('user_nama', userNama);
    preferences.commit();
    setState(() {});
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
    });
  }

  showToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
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
                      'Welcome',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Poppins-Bold',
                      ),
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Sign in to continue!',
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
                top: MediaQuery.of(context).size.height / 3,
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: TextFormField(
                        controller: _username,
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
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 14),
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
                            login();
                          },
                          child: Text(
                            'Login',
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
                          'or login with',
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
                    )
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
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'You don\'t have an account? SIGN UP',
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
