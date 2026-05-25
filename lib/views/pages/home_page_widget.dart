import 'package:event_hub/views/pages/event_page_widget.dart';
import 'package:event_hub/views/pages/register_page_widget.dart';
import 'package:event_hub/views/pages/upcoming_event.dart';
import 'package:event_hub/widgets/cards.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 16, 61, 101),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "E",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Event Hub",
              style: TextStyle(
                color: const Color.fromARGB(255, 16, 61, 101),
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 16, 61, 101),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              child: Text("Sign up"),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 40,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "WELCOME TO EVENT HUB",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue[400],
                ),
              ),
              Text(
                "Discover events that matter to you",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 21, 19, 19),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "Explore a curated list of events happening in your area. Register free and never miss an opportunity to connect, learn, and grow.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                    fontWeight: FontWeight(500),
                    color: const Color.fromARGB(255, 16, 61, 101),
                  ),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 16, 61, 101),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                ),
                child: Text("Browse Events", style: TextStyle(fontSize: 17)),
              ),
              const SizedBox(height: 20),
              Cards(
                title: "3+",
                dsecription: "Featured Event",
                bgColor: const Color.fromARGB(156, 227, 242, 253),
                borderColor: const Color.fromARGB(66, 33, 149, 243),
                textColor: const Color.fromARGB(255, 16, 61, 101),
              ),
              const SizedBox(height: 20),
              Cards(
                title: "10k+",
                dsecription: "Active Users",
                bgColor: const Color.fromARGB(162, 232, 245, 233),
                borderColor: const Color.fromARGB(91, 14, 238, 21),
                textColor: const Color.fromARGB(255, 16, 101, 16),
              ),
              const SizedBox(height: 20),
              Cards(
                title: "500",
                dsecription: "Registration",
                bgColor: const Color.fromARGB(144, 239, 232, 246),
                borderColor: const Color.fromARGB(255, 182, 158, 241),
                textColor: const Color.fromARGB(255, 49, 16, 101),
              ),
              const SizedBox(height: 20),
              Cards(
                title: "24/7",
                dsecription: "Support",
                bgColor: const Color.fromARGB(150, 241, 239, 178),
                borderColor: const Color.fromARGB(188, 242, 235, 44),
                textColor: const Color.fromARGB(255, 101, 73, 16),
              ),
              UpcomingEvent(),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 82, 129),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Ready to join?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Sign up today and get access to hundreds of amazing events.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.4,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(255, 16, 61, 101),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 36,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Get Started Now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 16, 61, 101),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
