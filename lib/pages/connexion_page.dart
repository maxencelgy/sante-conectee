import 'package:breath_meditation/pages/inscription_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({Key? key}) : super(key: key);

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/breath-img.png",
              height: 100,
              width: 100,
            ),
            Container(
                margin: EdgeInsets.only(left: 30),
                child: const Text(
                  "Se connecter",
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
                  "Connectez-vous pour accéder à nos exercices",
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
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()){
                            final email = emailController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Envoi en cours..."))
                            );
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: "FiraSansCondensed"
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF0FD0DA)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Vous n\'avez pas de compte? ',
                                    style: TextStyle(
                                        color: Colors.white
                                    )
                                ),
                                TextSpan(
                                    text: 'S\'inscrire',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => InscriptionPage()
                                        ));
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
