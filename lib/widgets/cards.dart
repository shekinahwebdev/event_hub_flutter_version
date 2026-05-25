import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.title,
    required this.dsecription,
    required this.bgColor,
    required this.textColor,
    required this.borderColor,
  });

  final String title;
  final String dsecription;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            color: bgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(dsecription, style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }
}
