import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF0EEE1),
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
