import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notifications')),
        body: Container(
          child: const Center(
            child: Text("This is screen opened after clicking on notification"),
          ),
        ));
  }
}
