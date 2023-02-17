import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        onPressed: (){
                          if (_formKey.currentState!.validate()){
                            final name = nameController.text;
                            final email = emailController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Envoi en cours..."))
                            );
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                      child: Text(
                        "S'inscrire",
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
                          text: 'Vous avez déjà un compte? ',
                          style: TextStyle(
                          color: Colors.white
                        )
                      ),
                        TextSpan(
                            text: 'Se connecter',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Service"');
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
    );
  }
}
