import 'package:event_hub/theme/app_theme.dart';
import 'package:event_hub/views/pages/home_page_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Event Hub",
      theme: AppTheme.lighTheme,
      home: HomePageWidget(),
    );
  }
}
