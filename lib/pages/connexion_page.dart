import 'dart:convert';
import 'package:breath_meditation/pages/inscription_page.dart';
import 'package:breath_meditation/pages/user/user_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:breath_meditation/change_notifier.dart';

class ConnexionPage extends StatefulWidget {
  @override
  _ConnexionPageState createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = '';

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = '';
    });

    final url = Uri.parse('https://api-node-breathe.hop.sh/api/auth/signin');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // debugPrint(json.decode(response.body)['accessToken']);
      // isLoggedIn = true;
      // userToken = json.decode(response.body)['accessToken'];
      final user = Provider.of<MyState>(context, listen: false);
      user.updateMyVariable(json.decode(response.body)['accessToken']);
      // Login successful
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserWidget(),
        ),
      );
    } else {
      // Login failed
      final body = json.decode(response.body);
      setState(() {
        _isLoading = false;
        _isError = true;
        _errorMessage = body['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Image.asset(
                    "assets/images/breath-img.png",
                    height: 100,
                    width: 100,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 30),
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: "FiraSansCondensed",
                        color: Colors.white),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 30),
                  child: const Text(
                    "Connectez-vous pour accéder à nos exercices",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "FiraSansCondensed",
                        color: Colors.white),
                  )),
              Container(
                margin: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Mot de passe",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                "Valider",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "FiraSansCondensed"),
                              ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0xFF0FD0DA)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            )),
                        onPressed: _isLoading ? null : _login,
                      ),
                    ),
                    if (_isError) ...[
                      SizedBox(height: 16.0),
                      Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Vous n\'avez pas de compte? ',
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: 'S\'inscrire',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InscriptionPage()),
                                );
                              })
                      ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
