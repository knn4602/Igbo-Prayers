import 'package:flutter/material.dart';
import 'package:igbo_prays_flutter/models/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, welcome to',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Ekpere Catholic Igbo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Your one-stop shop to guide you through Igbo prayers.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationPage(),
                  ),
                );
              },
              child: const Text('Begin Praying'),
            )

            ],
          ),
        ),
      ),
    );
  }
}
