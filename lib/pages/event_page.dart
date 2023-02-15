import 'package:flutter/material.dart';
import 'package:breath_meditation/main.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final events = [
    {
      "type" : "Focus",
      "date": "13h à 1h30",
      "subject": "Le code legacy",
      "image": "camp"
    },
    {
      "type" : "Bonheur",
      "date": "17h30 à 18h",
      "subject": "git blame --no-offense",
      "image": "deer"
    },
    {
      "type" : "Sommeil",
      "date": "18h à 18h30",
      "subject": "A la decouverte des IA generatif",
      "image": "camp"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index){

          final event = events[index];
          final avatar = event['image'];
          final speaker = event['type'];
          return  Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/$avatar.png",
              ),
              title: Text('$speaker'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
