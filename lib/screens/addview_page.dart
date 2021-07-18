import 'package:crypto_app/services/flutterfire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
  ];

  String dropdownValue = "bitcoin";
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownValue,
            onChanged: (value) {
              setState(() {
                dropdownValue = value.toString();
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 15.0),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextFormField(
              controller: amountController,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: "Coin Amount",
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 15.0),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 40,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.greenAccent),
            child: MaterialButton(
              onPressed: () async {
                await addCoin(dropdownValue, amountController.text);
                Navigator.of(context).pop();
              },
              // ignore: prefer_const_constructors
              child: Text('ADD'),
            ),
          ),
        ],
      ),
    );
  }
}
