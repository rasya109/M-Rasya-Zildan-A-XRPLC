import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRGenerated(),
    );
  }
}

class QRGenerated extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QRGenerated> {
  String selectedCalendar = "Cal2024";
  String uniqueCode = "";

  void generateUniqueCode() {
    var uuid = Uuid();
    String randomCode =
        uuid.v4().substring(0, 8); // Ambil 8 karakter pertama dari UUID
    String currentDate =
        DateTime.now().toString().split(' ')[0]; // Format: YYYY-MM-DD

    setState(() {
      uniqueCode = "$randomCode\_$selectedCalendar\_$currentDate\_NTREXPR";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Calendar: $selectedCalendar',
            ),
            SizedBox(height: 20),
            Text(
              'Generated Unique Code:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              uniqueCode,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            SizedBox(height: 20),
            QrImageView(
              data: uniqueCode,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generateUniqueCode();
              },
              child: Text('Generate Unique Code'),
            ),
          ],
        ),
      ),
    );
  }
}
