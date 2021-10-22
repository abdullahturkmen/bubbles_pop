import 'package:flutter/material.dart';

import 'main.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Teşekkürler",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 100),
              Text(
                "Özgür Kaygusuz",
                style: TextStyle(fontSize: 28),
              ),
              Text(
                "Senarist",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                "Abdullah Türkmen",
                style: TextStyle(fontSize: 28),
              ),
              Text(
                "Yazılımcı",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 100),
              ElevatedButton(
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
