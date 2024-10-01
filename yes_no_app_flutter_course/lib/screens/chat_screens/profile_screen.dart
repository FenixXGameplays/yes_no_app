import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String,dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(title: Text(arguments["nameProfile"] ?? ""),),
      body: Center(child: Text("PROFILE PAGE"),),
    );
  }
}
