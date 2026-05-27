import 'package:event_hub/views/pages/book_event_page_widget.dart';
import 'package:event_hub/views/pages/confirm_event_book_page.dart';
import 'package:event_hub/widgets/custom_info_row.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandDarkBlue = Color.fromARGB(255, 16, 61, 101);
    const Color textGrey = Color.fromARGB(255, 74, 85, 104);

    const String title = "Women in FlutterFlow";
    const String description =
        "Women in FlutterFlow is a community built up to help ladies with no coding experience to build up projects using no code.";
    const String location = "Google Office";
    const int totalSlots = 100;
    const int spotsLeft = 1;
    const int bookedSlots = totalSlots - spotsLeft;
    const double occupancyPercent = bookedSlots / totalSlots;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Event Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: brandDarkBlue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Arrow Link Row
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: brandDarkBlue,
                    ),
                    label: const Text(
                      "Back to events",
                      style: TextStyle(
                        color: brandDarkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                  const SizedBox(height: 16),

                  // Status Indicator Badge
                  Chip(
                    label: const Text("Registration Open"),
                    labelStyle: const TextStyle(
                      color: brandDarkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    backgroundColor: const Color(0xFFE0F2FE),
                    side: BorderSide.none,
                  ),
                  const SizedBox(height: 16),

                  // Heading Main Title
                  const Text(
                    title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Paragraph Description Text
                  const Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: textGrey,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // EVENT INFORMATION BOX
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Event Information",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        customInfoRow(
                          Icons.location_on,
                          "Location",
                          location,
                          const Color(0xFFF0F9FF),
                          brandDarkBlue,
                        ),
                        const SizedBox(height: 20),
                        customInfoRow(
                          Icons.people,
                          "Total Capacity",
                          "$totalSlots spots",
                          const Color(0xFFECFDF5),
                          const Color(0xFF065F46),
                        ),
                        const SizedBox(height: 20),
                        customInfoRow(
                          Icons.calendar_today,
                          "Spots Available",
                          "$spotsLeft spot left",
                          const Color(0xFFF5F3FF),
                          const Color(0xFF5B21B6),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // REGISTRATION STATUS BOX
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Registration Status",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$bookedSlots of $totalSlots spots booked",
                              style: const TextStyle(
                                color: textGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${(occupancyPercent * 100).toInt()}%",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Linear Percentage Progress Indicator Bar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: occupancyPercent,
                            minHeight: 10,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Booking Navigation Button
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              // Route execution to form
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ConfirmEventBookPage(),
                                ),
                              );
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: brandDarkBlue,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              "Book Now",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
