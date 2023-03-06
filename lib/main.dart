import 'package:breath_meditation/pages/home_page.dart';
import 'package:breath_meditation/pages/inscription_page.dart';
import 'package:breath_meditation/pages/connexion_page.dart';
import 'package:flutter/material.dart';

const navbarColor = Color(0xFF0FD0DA);
//const primaryColor = Color(0xFF151026);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF122944),
      ),
      home: Scaffold(
        body: [
          HomePage(),
          // ExplorerPage(),
          // ProfilPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          backgroundColor: const Color(0xFF1E3756),
          selectedItemColor: const Color(0xFF0FD0DA),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Explorer'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil'
            ),
          ],
        ),
      ),
    );
  }
}









