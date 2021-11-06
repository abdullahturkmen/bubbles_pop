import 'package:flutter/material.dart';

class TopScores extends StatelessWidget {
  const TopScores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF0EEE1),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(25.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFF151B2B),
              border: Border.all(color: Colors.blueAccent, width: 5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("cleopatra"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "807",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ), //aralarına çizgi tanımlamak için
                      //Divider widget'ını tanımlıyoruz

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("Berkay Çobanbaş"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "784",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("Murat Tuna"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "781",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("ÜzgünKöpke"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "767",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ), //aralarına çizgi tanımlamak için
                      //Divider widget'ını tanımlıyoruz

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("yusuf123"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "529",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("şulekayacan"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "411",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("Özgür Kaygusuz"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "358",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ), //aralarına çizgi tanımlamak için
                      //Divider widget'ını tanımlıyoruz

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("ÖmerErkam"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "351",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("AbdullahLipa"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "315",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),

                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text("Damla Yıldız"),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "299",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey, width: 2.0),
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
      ),
    );
  }
}
