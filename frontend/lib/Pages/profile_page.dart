import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  final TextEditingController nameController =
  TextEditingController(text: "John Doe");
  final TextEditingController emailController =
  TextEditingController(text: "john.doe@example.com");
  final TextEditingController phoneController =
  TextEditingController(text: "+213 555 123 456");

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveProfile() {
    setState(() {
      isEditing = false;
      // In the future, send updated data to your backend here (POST/PATCH)
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
        const Text("PlantTracker", style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit,
                color: Colors.green),
            onPressed: isEditing ? saveProfile : toggleEdit,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green.shade200,
                child: const Icon(Icons.person, size: 40),
              ),
            ),
            const SizedBox(height: 20),

            // Name
            buildProfileField(
              label: "Name",
              controller: nameController,
              enabled: isEditing,
            ),

            // Email
            buildProfileField(
              label: "Email",
              controller: emailController,
              enabled: isEditing,
            ),

            // Phone
            buildProfileField(
              label: "Phone number",
              controller: phoneController,
              enabled: isEditing,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/workers_by_greenhouse');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("List of Workers"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileField({
    required String label,
    required TextEditingController controller,
    required bool enabled,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          fillColor: enabled ? Colors.white : Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
