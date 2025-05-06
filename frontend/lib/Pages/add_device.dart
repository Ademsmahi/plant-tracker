import 'package:flutter/material.dart';

class AddDevicePage extends StatelessWidget {
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController deviceTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Device')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: deviceNameController,
              decoration: InputDecoration(labelText: 'Device Name'),
            ),
            TextField(
              controller: deviceTypeController,
              decoration: InputDecoration(labelText: 'Device Type'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Send device info to backend
                Navigator.pop(context); // go back to device list
              },
              child: Text('Add Device'),
            ),
          ],
        ),
      ),
    );
  }
}
