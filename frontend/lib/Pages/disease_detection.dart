import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ImagePickerPage.dart';

class DiseaseDetectionPage extends StatefulWidget {
  @override
  State<DiseaseDetectionPage> createState() => _DiseaseDetectionPageState();
}

class _DiseaseDetectionPageState extends State<DiseaseDetectionPage> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    // Navigate to ImagePickerPage and await the picked File
    final File? image = await Navigator.push<File?>(
      context,
      MaterialPageRoute(builder: (_) => ImagePickerPage()),
    );
    if (image != null) {
      setState(() => _selectedImage = image);
      // TODO: pass `image` to your AI model or upload to backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("PlantTracker", style: GoogleFonts.poppins(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _pickImage,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.green[600],
              borderRadius: BorderRadius.circular(16),
            ),
            child: _selectedImage == null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_camera, size: 60, color: Colors.white),
                SizedBox(height: 12),
                Text("Add plant picture",
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 16)),
              ],
            )
                : Image.file(_selectedImage!, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
