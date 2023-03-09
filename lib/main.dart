import 'package:breath_meditation/pages/home_page.dart';
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
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myState = Provider.of<MyState>(context);
    return MaterialApp(
      title: 'Mon application',
      initialRoute: '/signup',
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
        body: HomePage(),
        bottomNavigationBar: BottomNavigationBar(
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
