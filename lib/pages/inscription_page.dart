import 'package:breath_meditation/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:breath_meditation/change_notifier.dart';


class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = '';

  Future<void> _inscription() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = '';
    });

    final url = Uri.parse('https://api-node-breathe.hop.sh/api/auth/signup');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "username": nameController.text,
        "userEmotion": [],
        "breakId": 1,
        "email": emailController.text,
        "role": "user",
        "password": passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConnexionPage()),
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
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 30),
                child: const Text(
                  "S'inscrire",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "FiraSansCondensed",
                      color: Colors.white
                  ),
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 30),
                child: const Text(
                  "Inscrivez-vous pour accéder à nos exercices",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "FiraSansCondensed",
                      color: Colors.white
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                            hintText: "Prénom et nom",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            )
                        ),
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "Vous devez remplir ce champ";
                          }
                          return null;
                        },
                        controller: nameController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            )
                        ),
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "Vous devez remplir ce champ";
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                            hintText: "Mot de passe",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            )
                        ),
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "Vous devez remplir ce champ";
                          }
                          return null;
                        },
                        controller: passwordController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                            hintText: "Confirmation du mot de passe",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            )
                        ),
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "Vous devez remplir ce champ";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        child: _isLoading ? CircularProgressIndicator() : Text(
                          'Valider',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: "FiraSansCondensed"
                          ),
                        ),
                        onPressed: _isLoading ? null : _inscription,
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0xFF0FD0DA)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Vous avez déjà un compte? ',
                                    style: TextStyle(
                                        color: Colors.white
                                    )
                                ),
                                TextSpan(
                                    text: 'Se connecter',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700, color: Colors.white),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ConnexionPage()),
                                        );
                                      })
                              ]
                          )
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
        ),
    );
  }
}
