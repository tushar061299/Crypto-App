import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/model/api_methods.dart';
import 'package:crypto_app/services/flutterfire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'addview_page.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bitcoin = 0.0;
  double tether = 0.0;
  double ethereum = 0.0;
  double cardano = 0.0;
  double polkadot = 0.0;

  @override
  void initState() {
    getValues();
  }

  getValues() async {
    bitcoin = await getPrice("bitcoin");
    ethereum = await getPrice("ethereum");
    cardano = await getPrice("cardano");
    tether = await getPrice("tether");
    polkadot = await getPrice("polkadot");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getValue(String id, double amount) {
      if (id == "bitcoin") {
        return bitcoin * amount;
      } else if (id == "ethereum") {
        return ethereum * amount;
      } else if (id == "cardano") {
        return cardano * amount;
      } else if (id == "polkadot") {
        return polkadot * amount;
      } else {
        return tether * amount;
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('Coins')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                // ignore: prefer_const_constructors
                return Center(
                  // ignore: prefer_const_constructors
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map(
                  (document) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 14,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Coin: ${(document.id).toUpperCase()}",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              "\$${(getValue(document.id, (document.data() as dynamic)!["Amount"])).toStringAsFixed(2)}",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await removeCoin(document.id);
                              },
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.close,
                                color: Colors.green[800],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => AddView(),
            ),
          );
        },
        // ignore: prefer_const_constructors
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
