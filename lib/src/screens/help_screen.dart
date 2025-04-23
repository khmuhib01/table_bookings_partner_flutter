import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:table_bookings_partner_flutter/src/routes/app_routes.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  // helper to open email
  Future<void> _emailSupport() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'support@tablebookings.co.uk',
      queryParameters: {'subject': 'Support Request'},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // you could show an error snackbar here
      debugPrint('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final faqs = <Map<String, String>>[
      {
        'question': 'How do I make a reservation?',
        'answer':
            'Tap the “Reservation” tab, choose a date & time, then confirm.'
      },
      {
        'question': 'Can I cancel or modify my booking?',
        'answer':
            'Yes – open the Reservation tab, find your booking and tap “Cancel” or “Edit.”'
      },
      {
        'question': 'How do I contact support?',
        'answer':
            'Email us at support@tablebookings.co.uk or call +44 1234 567890.'
      },
      {
        'question': 'Where can I find my past bookings?',
        'answer':
            'Under the Reservation tab, scroll down to “Past Reservations.”'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & FAQs', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 2,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, i) {
          final faq = faqs[i];
          return ExpansionTile(
            title: Text(faq['question']!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(faq['answer']!),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
                icon: const Icon(Icons.home),
                label: const Text('Home'),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: _emailSupport,
                icon: const Icon(Icons.email),
                label: const Text('Email Support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
