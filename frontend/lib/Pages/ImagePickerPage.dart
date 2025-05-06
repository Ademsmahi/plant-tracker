import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pick(BuildContext context, ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source, imageQuality: 80);
    if (picked != null) {
      Navigator.pop(context, File(picked.path));
    } else {
      Navigator.pop(context, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Image", style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text("From Gallery", style: GoogleFonts.poppins()),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: () => _pick(context, ImageSource.gallery),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Take Photo", style: GoogleFonts.poppins()),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: () => _pick(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}
