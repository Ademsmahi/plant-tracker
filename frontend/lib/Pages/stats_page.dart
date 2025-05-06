import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlantTracker", style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("🔔 Recent Alerts", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Soil moisture dropped too fast - 18:25"),
                  Text("Night temperature is too low - 14:53"),
                  Text("A1 device low battery - 11:13"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text("Analysis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Spacer(),
                Text("Last month", style: TextStyle(color: Colors.grey)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            const SizedBox(height: 12),
            Placeholder(fallbackHeight: 150),
            const SizedBox(height: 12),
            Placeholder(fallbackHeight: 150),
          ],
        ),
      ),
    );
  }
}
