import 'package:flutter/material.dart';

class WaitingScreen extends StatelessWidget {
  final String role;

  const WaitingScreen({required this.role});

  @override
  Widget build(BuildContext context) {
    final code = "ABCD1234"; // This would be dynamic from backend later

    return Scaffold(
      appBar: AppBar(title: Text("Awaiting Approval")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome $role!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text(
                "You are currently waiting for a manager to approve and add you.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text("Your code:", style: TextStyle(fontSize: 18)),
              Text(code, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
              SizedBox(height: 20),
              Text("Share this code with your manager to be added."),
            ],
          ),
        ),
      ),
    );
  }
}
