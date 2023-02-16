import 'package:breath_meditation/pages/login_page.dart';
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
            "Breath",
            style: TextStyle(
                fontSize: 42,
                fontFamily: 'Poppins',
                color: Colors.white
            ),
          ),
          const Text("Une application pour se détendre",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),

          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_,__,___) =>  LoginPage()
                  )
              );
            },
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
              backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF0FD0DA)),
            ),
            child: const Text(
              "Se connecter",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
        ],
      ),
    );
  }
}