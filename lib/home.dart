import 'package:crypto_app/screens/home_page.dart';
import 'package:crypto_app/screens/market.dart';
import 'package:crypto_app/screens/news.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;

  final _pageOptions = [
    MarketPage(),
    NewsPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.price_change),
            label: 'Market',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'News',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
            backgroundColor: Colors.purple,
          ),
        ],
        selectedItemColor: Colors.green,
        elevation: 5.0,
        unselectedItemColor: Colors.green[900],
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
