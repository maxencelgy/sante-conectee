import 'package:flutter/material.dart';
import 'package:breath_meditation/change_notifier.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('userToken: ${user.token}', ),
      ),
    );
  }
}
