import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVolunteerOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('112 India', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Volunteer Status Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Volunteer Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text('Connect online to help others nearby', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChoiceChip(
                          label: const Text('Offline'),
                          selected: !isVolunteerOnline,
                          onSelected: (val) => setState(() => isVolunteerOnline = false),
                        ),
                        const SizedBox(width: 10),
                        ChoiceChip(
                          label: const Text('Online'),
                          selected: isVolunteerOnline,
                          selectedColor: Colors.green.shade200,
                          onSelected: (val) => setState(() => isVolunteerOnline = true),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Contact Emergency Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            // Emergency Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                _emergencyButton('WOMAN SAFETY', Icons.shield, Colors.pink),
                _emergencyButton('MEDICAL', Icons.local_hospital, Colors.red),
                _emergencyButton('POLICE', Icons.local_police, Colors.blue),
                _emergencyButton('FIRE', Icons.local_fire_department, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _emergencyButton(String title, IconData icon, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: color.withOpacity(0.5)),
      ),
      onPressed: () {
        // This will open the SOS trigger dialog
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}