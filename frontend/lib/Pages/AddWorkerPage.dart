import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWorkerPage extends StatefulWidget {
  @override
  _AddWorkerPageState createState() => _AddWorkerPageState();
}

class _AddWorkerPageState extends State<AddWorkerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  String? _selectedGreenhouse;
  final List<String> _greenhouses = [
    "Greenhouse A",
    "Greenhouse B",
    "Greenhouse C",
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedGreenhouse != null) {
      final newWorkerName = _nameController.text;
      final greenhouse = _selectedGreenhouse!;

      // TODO: Implement backend POST here
      print("Add $newWorkerName to $greenhouse");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
          Text("Worker '$newWorkerName' added to $greenhouse"),
        ),
      );

      // Return the new worker data to the previous screen
      Navigator.pop(context, {
        'name': newWorkerName,
        'greenhouse': greenhouse,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Worker", style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  labelText: 'Worker Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Please enter a name'
                    : null,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedGreenhouse,
                items: _greenhouses
                    .map((g) => DropdownMenuItem(
                  value: g,
                  child: Text(g, style: GoogleFonts.poppins()),
                ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: "Select Greenhouse",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (v) => setState(() => _selectedGreenhouse = v),
                validator: (v) =>
                v == null ? 'Please select a greenhouse' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Add Worker',
                    style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
