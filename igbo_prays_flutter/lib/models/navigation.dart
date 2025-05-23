
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Igbo Prays')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
          children: [
            const SizedBox(height: 30),
            const Text(
              'You made it here!',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 10),
            const Text(
              'Where would you ',
              style: TextStyle(fontSize: 35),
            ),
            const Text(
              'like to begin',
              style: TextStyle(fontSize: 35),
            ),
            const Text(
              'your journey?',
              style: TextStyle(fontSize: 33),
            ),
            const SizedBox(height: 32),

            // ✅ Add a flexible grid view
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                itemCount: 6,
                itemBuilder: (context, index) => _buildTile(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(int index) {
    return Container(
      height: 100 + (index % 3) * 30,
      decoration: BoxDecoration(
        color: Colors.green[100 * ((index % 5) + 1)],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Tile $index',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}