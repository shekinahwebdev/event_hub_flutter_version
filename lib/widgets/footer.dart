import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandColor = Color.fromARGB(255, 16, 61, 101);
    const Color linkColor = Color.fromARGB(255, 74, 85, 104);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Event Hub",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: brandColor,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Discover and register for events that matter to you.",
            style: TextStyle(fontSize: 15, color: linkColor, height: 1.4),
          ),
          const SizedBox(height: 32),
          _buildFooterCategory("Product", ["Events", "Pricing"], linkColor),
          const SizedBox(height: 24),
          _buildFooterCategory("Company", ["About", "Contact"], linkColor),
          const SizedBox(height: 24),
          _buildFooterCategory("Legal", ["Privacy", "Terms"], linkColor),
          const SizedBox(height: 32),

          Divider(color: Colors.grey.shade200, thickness: 1),
          const SizedBox(height: 24),
          Row(
            children: [
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "© 2026 Event Hub. All rights reserved.",
                  style: TextStyle(color: linkColor, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterCategory(
    String title,
    List<String> links,
    Color linkColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        ...links.map(
          (linkText) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                linkText,
                style: TextStyle(fontSize: 15, color: linkColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
