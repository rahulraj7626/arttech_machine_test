import 'package:art_tech_machine_test/src/auth/data/models/login_model/login_request.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final LoginRequest data;
  const Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 23);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome",
            style: textStyle,
          ),
          Text(
            "Loggined ${data.email}",
            style: textStyle,
          ),
        ],
      )),
    );
  }
}
