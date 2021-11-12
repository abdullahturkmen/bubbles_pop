// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Color(0xFFF0EEE1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Teşekkürler",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 50),
              Card(
                child: ListTile(
                  title: Text('Özgür KAYGUSUZ'),
                  subtitle: Text('Senarist / Elektrik-Elektronik Müh.'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Abdullah TÜRKMEN'),
                  subtitle: Text('Yazılımcı / Front End Dev.'),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF151B2B)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFF151B2B), width: 2.0),
                    ),
                  ),
                ),
                child: const Text("Kapat"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
