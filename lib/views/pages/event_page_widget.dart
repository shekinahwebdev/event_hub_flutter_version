import 'package:event_hub/views/pages/confirm_event_book_page.dart';
import 'package:event_hub/views/pages/event_detail_page_widget.dart';
import 'package:event_hub/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandDarkBlue = Color.fromARGB(255, 16, 61, 101);

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 248, 249, 250),
      appBar: AppBar(
        title: const Text(
          "All Events",
          style: TextStyle(fontWeight: FontWeight.bold, color: brandDarkBlue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BROWSE",
              style: TextStyle(
                color: Colors.blue.shade600,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "All Events",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Explore all available events and find the perfect one for you.",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 24),

            EventCard(
              status: "Available",
              title: "Women in FlutterFlow",
              description:
                  "Women in FlutterFlow is a community built up to help ladies with no coding experience to build up projects using no code",
              location: "Google Office",
              totalSlots: 100,
              remainingSpots: 1,
              showButtons: true,
              onBookPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ConfirmEventBookPage();
                    },
                  ),
                );
              },
              onDetailsPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EventDetailPage();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
