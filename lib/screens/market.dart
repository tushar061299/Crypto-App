import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/services/coin_card.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  Future<void> _onRefresh(BuildContext context) async {
    fetchCoin();
  }

  @override
  void initState() {
    fetchCoin();
    // ignore: prefer_const_constructors
    Timer.periodic(Duration(seconds: 2), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(
            'MARKET',
            // ignore: prefer_const_constructors
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: coinList.length,
            itemBuilder: (context, index) {
              return CoinCard(
                name: coinList[index].name,
                symbol: coinList[index].symbol,
                imageUrl: coinList[index].imageUrl,
                price: coinList[index].price.toDouble(),
                change: coinList[index].change.toDouble(),
                changePercentage: coinList[index].changePercentage.toDouble(),
              );
            },
          ),
        ));
  }
}
