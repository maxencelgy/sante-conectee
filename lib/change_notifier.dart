import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
class MyState extends ChangeNotifier {
  String token = '';
  String username = '';

  Future<void> updateMyVariable(String value) async {

    String yourToken = value;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(value);


    final url = Uri.parse('https://api-node-breathe.hop.sh/api/users/${decodedToken['id']}');
    final response = await http.get(
      url,
      headers: {
        'x-access-token': value,
        'Content-Type': 'application/json',
      },
    );

    // debugPrint(value);
    // debugPrint(decodedToken['id']);
    // debugPrint(JwtDecoder.getExpirationDate(value).toString());
    // debugPrint(value);

    token = value;
    username = json.decode(response.body)['username'];
    notifyListeners();
  }
}
