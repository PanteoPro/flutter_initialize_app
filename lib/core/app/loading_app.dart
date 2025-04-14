import 'package:flutter/material.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({
    super.key,
    required this.progressNotifier,
  });

  final ValueNotifier<(int, String)> progressNotifier;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: ValueListenableBuilder<(int, String)>(
            valueListenable: progressNotifier,
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:
                      (MediaQuery.of(context).size.width * 0.8).clamp(100, 500),
                  child: LinearProgressIndicator(value: value.$1 / 100),
                ),
                Text('Progress: ${value.$1}% | ${value.$2}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
