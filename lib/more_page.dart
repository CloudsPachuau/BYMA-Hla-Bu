import 'package:flutter/material.dart';
import 'about_page.dart'; // Ensure this file is imported
// Ensure this file is imported
import 'favorites_page.dart';
import 'feedback_page.dart'; // Ensure this file is imported

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90.0), // Add top padding
        child: ListView(
          padding: const EdgeInsets.all(6.0),
          children: [
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("BYMA Hla Bu App Chungchang"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPageContent(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_outline),
              title: const Text("Favorites"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const FavoritesPage(), // No parameters are required
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text("Feedback"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedbackPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("BYMA Hla Bu thawn (Share) na"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text("Rate BYMA Hla Bu App"),
              onTap: () {
                // Add rate app functionality
              },
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}
