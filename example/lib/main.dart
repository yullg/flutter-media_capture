import 'package:flutter/material.dart';
import 'package:media_capture/media_capture.dart';
import 'package:scaffold/scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: [
            EasyListTile(
              nameText: "IosBroadcastActivityPlugin.start",
              onTap: () {
                IosBroadcastActivityPlugin.start().catchError((e, s) {
                  DefaultLogger().error(null, e, s);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
