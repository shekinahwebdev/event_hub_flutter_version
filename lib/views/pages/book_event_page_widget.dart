import 'package:flutter/material.dart';

class BookEventPage extends StatefulWidget {
  const BookEventPage({super.key});

  @override
  State<BookEventPage> createState() => _BookEventPageState();
}

class _BookEventPageState extends State<BookEventPage> {
  @override
  Widget build(BuildContext context) {
    const Color brandDarkBlue = Color.fromARGB(255, 16, 61, 101);
    const Color textGrey = Color.fromARGB(255, 74, 85, 104);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 60),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 64,
                        color: Colors.green,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Booking Confirmed!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "You have successfully booked a spot for Women in FlutterFlow",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: textGrey),
                      ),
                      const SizedBox(height: 24),

                      // Confirmation Summary Card Info Block
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Event: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Women in FlutterFlow"),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "Location: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Google Office"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      FilledButton(
                        onPressed: () => Navigator.pop(context),
                        style: FilledButton.styleFrom(
                          backgroundColor: brandDarkBlue,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text("Return to Dashboard"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
