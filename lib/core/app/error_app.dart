import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  const ErrorApp({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final String error;
  final String stackTrace;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error),
                Text(stackTrace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
