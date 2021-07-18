import 'package:crypto_app/screens/home_page.dart';
import 'package:crypto_app/services/flutterfire.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // ignore: prefer_final_fields
  TextEditingController _emailField = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          // ignore: unnecessary_new
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            // ignore: prefer_const_constructors
            image: AssetImage("lib/images/art-rachen-yJpjLD3c9bU-unsplash.jpg"),
          ),
          color: Colors.white24,
        ),
        // ignore: prefer_const_constructors
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: avoid_unnecessary_containers
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                controller: _emailField,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'abc@gmail.com',
                  // ignore: prefer_const_constructors
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: "E-mail",
                  // ignore: prefer_const_constructors
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                  // ignore: prefer_const_constructors
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                controller: _passwordField,
                obscureText: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'password',
                  // ignore: prefer_const_constructors
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: "Password",
                  // ignore: prefer_const_constructors
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),
                  // ignore: prefer_const_constructors
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 40,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.greenAccent),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await registerIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                // ignore: prefer_const_constructors
                child: Text('Register'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 40,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.greenAccent),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                // ignore: prefer_const_constructors
                child: Text('Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
