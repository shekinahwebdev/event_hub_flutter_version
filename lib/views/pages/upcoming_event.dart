import 'package:event_hub/views/pages/book_event_page_widget.dart';
import 'package:event_hub/views/pages/event_page_widget.dart';
import 'package:event_hub/widgets/event_card.dart';
import 'package:flutter/material.dart';

class UpcomingEvent extends StatelessWidget {
  const UpcomingEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UPCOMING",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Featured Events",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Don't miss out on these exciting events. Register today to secure our spot!",
            style: TextStyle(fontSize: 16),
          ),

          EventCard(
            status: "Available",
            title: "Women in FlutterFlow",
            description:
                "Women in FlutterFlow is a community built up to help ladies with no coding experience to build up projects using no code",
            remainingSpots: 3,
            location: "Google Office",
            showButtons: false,
            showTotalSlots: false,
            onBookPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BookEventPage();
                  },
                ),
              );
            },
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EventsPage();
                    },
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Color.fromARGB(255, 183, 206, 225),
                  width: 1.5,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                "View All Events",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
