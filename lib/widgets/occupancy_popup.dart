import 'package:flutter/material.dart';

class OccupancyScreen extends StatefulWidget {
  const OccupancyScreen({super.key, this.totalAdult});

  final totalAdult;

  @override
  State<OccupancyScreen> createState() => _OccupancyScreen();
}

class _OccupancyScreen extends State<OccupancyScreen> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ผู้ใหญ่',
                  icon: Icon(Icons.account_box),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'เด็ก',
                  icon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'จำนวนห้อง',
                  icon: Icon(Icons.message),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            child: Text("Submit"),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
