import 'package:flutter/material.dart';
import 'add_device.dart'; // import the AddDevicePage

class DeviceListPage extends StatelessWidget {
  final List<Map<String, String>> devices = [
    {'name': 'Temperature Sensor', 'type': 'Sensor'},
    {'name': 'Humidity Sensor', 'type': 'Sensor'},
  ]; // Placeholder device list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddDevicePage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.device_hub),
            title: Text(devices[index]['name']!),
            subtitle: Text(devices[index]['type']!),
          );
        },
      ),
    );
  }
}
