import 'package:flutter/material.dart';

void main() {
  runApp(Ventas());
}

class Ventas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Mundo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red, // Set the background color to red
          title: Text('VENTAS'), // Set the title to VENTAS
          leading: IconButton( // Add a back button
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text(
            '¡Hola Mundo!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}