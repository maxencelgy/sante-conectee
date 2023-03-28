import 'package:breath_meditation/pages/login_page.dart';
import 'package:breath_meditation/pages/connexion_page.dart';
import 'package:breath_meditation/pages/inscription_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:breath_meditation/change_notifier.dart';



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image.asset(
            "assets/images/breath-img.png",
            height: 250,
            width: 250,
          ),
          const Text(
            "BREATHE",
            style: TextStyle(
                fontSize: 42,
                fontFamily: 'Poppins',
                color: Colors.white
            ),
          ),
          const Text("Respire bâtard",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
          // const Padding(padding: EdgeInsets.only(top: 20)),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         PageRouteBuilder(
          //             pageBuilder: (_,__,___) => const EventPage()
          //         )
          //     );
          //   },
          //   style: const ButtonStyle(
          //     padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
          //     backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF0FD0DA)),
          //   ),
          //   child: const Text(
          //     "Se connecter",
          //     style: TextStyle(
          //         fontSize: 20
          //     ),
          //   ),
          // )
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => ConnexionPage()
                      )
                      );
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
          )
        ],
      ),
    );
  }
}