import 'package:flutter/material.dart';
import 'ventana2.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Login'),
      backgroundColor: Colors.deepPurple,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(size: 100.0),
            const SizedBox(height: 50.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Ventana2()),
                );
              },
            ),
            const SizedBox(height: 20.0),
            TextButton(
              child: const Text('Forgot password?'),
              onPressed: () {
                // Handle forgot password
              },
            ),
          ],
        ),
      ),
    ));
  }
}

