import 'package:flutter/material.dart';
import 'package:igbo_prays_flutter/models/navigation.dart';
void main() {
  runApp(const IgboPraysApp());
}

class IgboPraysApp extends StatelessWidget {
  const IgboPraysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Igbo Prays',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 213, 213),
      appBar: AppBar(
        title: const Text('Igbo Prays'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello! Welcome to Ekpere Catholic Igbo.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Your one-stop guide to praying in Igbo.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
