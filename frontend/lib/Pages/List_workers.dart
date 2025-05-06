import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AddWorkerPage.dart';
import 'WorkerDetailPage.dart';

class WorkersByGreenhousePage extends StatefulWidget {
  @override
  State<WorkersByGreenhousePage> createState() =>
      _WorkersByGreenhousePageState();
}

class _WorkersByGreenhousePageState
    extends State<WorkersByGreenhousePage> {
  Map<String, List<String>> greenhouseWorkers = {
    "Greenhouse A": ["adem", "achraf"],
    "Greenhouse B": ["abdou", "adfafe", "rsg"],
    "Greenhouse C": ["fsfef"],
  };

  void _navigateToWorkerDetail(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            WorkerDetailPage(workerName: name),
      ),
    );
  }

  void _showWorkerOptions(
      String greenhouse, String worker) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading:
              const Icon(Icons.edit, color: Colors.orange),
              title: const Text('Edit Worker'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Edit $worker not implemented yet'),
                  ),
                );
              },
            ),
            ListTile(
              leading:
              const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete Worker'),
              onTap: () {
                setState(() {
                  greenhouseWorkers[greenhouse]
                      ?.remove(worker);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final greenhouseNames =
    greenhouseWorkers.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Workers by Greenhouse',
            style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: greenhouseNames.length,
        itemBuilder: (context, i) {
          final greenhouse = greenhouseNames[i];
          final workers = greenhouseWorkers[greenhouse]!;

          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    greenhouse,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...workers.map((worker) =>
                      GestureDetector(
                        onTap: () =>
                            _navigateToWorkerDetail(
                                worker),
                        onLongPress: () =>
                            _showWorkerOptions(
                                greenhouse, worker),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(
                              vertical: 4),
                          child: Row(
                            children: [
                              const Icon(Icons.person,
                                  color: Colors.green),
                              const SizedBox(width: 8),
                              Text(worker,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16)),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddWorkerPage(),
            ),
          );

          if (result != null &&
              result['name'] != null &&
              result['greenhouse'] != null) {
            final String name = result['name'];
            final String greenhouse =
            result['greenhouse'];

            setState(() {
              if (greenhouseWorkers
                  .containsKey(greenhouse)) {
                greenhouseWorkers[greenhouse]!.add(name);
              } else {
                greenhouseWorkers[greenhouse] = [name];
              }
            });
          }
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        tooltip: "Add Worker",
      ),
    );
  }
}
