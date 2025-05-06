import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'green_house_bean.dart';

class HomeContentPage extends StatelessWidget {
  Future<List<Greenhouse>> fetchGreenhouses() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('user_token');
    final user_id = prefs.getString('user_id');

    final response = await http.post(
      Uri.parse('http://192.168.36.156:8080/api/serre/${user_id!}/all'),
      headers: {
        'Authorization': 'Bearer : $token',
        'Content-Type': 'application/json',
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      print(data);
      return data.map((item) => Greenhouse.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load greenhouses: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PlantTracker", style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: const [
                Icon(Icons.wb_sunny, color: Colors.orange),
                SizedBox(width: 8),
                Text("28°C", style: TextStyle(fontSize: 18)),
                Spacer(),
                Icon(Icons.warning_amber_rounded, color: Colors.green),
                SizedBox(width: 4),
                Text("Alerts 0", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.green ,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Greenhouses",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Fetch and display greenhouses from backend
                  FutureBuilder<List<Greenhouse>>(
                    future: fetchGreenhouses(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator(color: Colors.white));
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white));
                      }

                      final greenhouses = snapshot.data!;
                      return Column(
                        children: greenhouses.map((gh) {
                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              leading: Icon(Icons.eco_outlined, size: 40),
                              title: Text(gh.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${gh.temperature}°C • ${gh.humidity}%'),
                                  Text('Light: ${gh.light}  |  pH: ${gh.ph}'),
                                ],
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
