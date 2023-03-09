import 'package:breath_meditation/pages/home_page.dart';
import 'package:breath_meditation/pages/inscription_page.dart';
import 'package:breath_meditation/pages/connexion_page.dart';
import 'package:flutter/material.dart';
import 'package:breath_meditation/pages/login_page.dart';
import 'package:breath_meditation/pages/profile_page.dart';
import 'package:breath_meditation/change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:breath_meditation/pages/inscription_page.dart';

const navbarColor = Color(0xFF0FD0DA);
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyState(),
      child: MyApp(),
    ),
  );
}


// final user = User(); // Ajouter cette ligne
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
    final myState = Provider.of<MyState>(context);
    return MaterialApp(
      title: 'Mon application',
      initialRoute: '/login',
      // Route de départ
      routes: {
        // '/home': (context) => HomePage(),
        '/signup': (context) => InscriptionPage(),
        '/login': (context) => LoginPage(),
        '/profile': (context) => ProfilePage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF122944),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('userToken: ${myState.token}'),
        ),
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Explorer'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
