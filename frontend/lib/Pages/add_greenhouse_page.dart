import 'package:flutter/material.dart';
import 'manager/manager_home_page.dart';

class AddGreenhousePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to PlantTracker", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("• Monitor & control your greenhouses in real-time!\n• Get alerts & AI-driven disease detection!\n• Analyze trends to improve plant health!", textAlign: TextAlign.left),
            SizedBox(height: 30),
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Greenhouse Name")),
            TextField(controller: locationController, decoration: InputDecoration(labelText: "Location")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // In a real app, send this data to backend
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ManagerHomePage()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 10),
                  Text("Add Greenhouse"),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ManagerHomePage()));
              },
              child: Text("Continue without adding", style: TextStyle(color: Colors.green)),
            )
          ],
        ),
      ),
    );
  }
}
