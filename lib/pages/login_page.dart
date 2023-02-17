import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:breath_meditation/change_notifier.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    final url = Uri.parse('http://localhost:8080/api/auth/signin');
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
      Navigator.pushNamed(context, '/profile');
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
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: _isLoading ? CircularProgressIndicator() : Text('Login'),
              onPressed: _isLoading ? null : _login,
            ),
            if (_isError) ...[
              SizedBox(height: 16.0),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
