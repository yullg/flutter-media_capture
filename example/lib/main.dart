import 'package:flutter/material.dart';
import 'package:media_capture/media_capture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text("Start"),
              onTap: () {
                IosBroadcastActivityPlugin.start(
                        preferredExtension:
                            "com.yullg.flutter.mediaCaptureExample.BroadcastExtension")
                    .catchError((e) {
                  print(e.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
