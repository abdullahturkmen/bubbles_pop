// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

final firestore = FirebaseFirestore.instance;

class TopScores extends StatefulWidget {
  const TopScores({Key? key, required this.userID}) : super(key: key);

  final String userID;

  @override
  _TopScoresState createState() => _TopScoresState();
}

class _TopScoresState extends State<TopScores> {
  Query<Map<String, dynamic>> userScors = firestore.collection('user_scores');
  var userList = [];
  var userDetailsList = [];

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await userScors.orderBy('user_score', descending: true).limit(10).get();

    QuerySnapshot userDetails =
        await userScors.where('id', isEqualTo: widget.userID.toString()).get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final allUserData = userDetails.docs.map((doc) => doc.data()).toList();

    setState(() {
      userList = allData;
      userDetailsList = allUserData;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(userDetailsList[0]['user_name']);
    return Scaffold(
      body: Container(
        color: Color(0xFFF0EEE1),
        child: Center(
          child: Container(
            //margin: const EdgeInsets.all(25.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFF151B2B),
              //border: Border.all(color: Colors.blueAccent, width: 5),
              //borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                userDetailsList.length < 1
                    ? LinearProgressIndicator()
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF0EEE1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: [
                            SizedBox(height: 20),
                            Text(
                              userDetailsList[0]['user_name'],
                              style: TextStyle(fontSize: 26),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 35,
                                ),
                                Text(
                                  userDetailsList[0]['user_score'].toString(),
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                Expanded(
                  child: ListView(
                    children: userList.map((data) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Color(0xFFF0EEE1),
                        child: ListTile(
                          title: Text(data['user_name']),
                          //subtitle: Text(userList.length.toString()),
                          trailing: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                Image.asset(
                                  'lib/assets/images/score-icon.png',
                                  width: 25,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  data['user_score'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                      );
                    }).toList(),
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
