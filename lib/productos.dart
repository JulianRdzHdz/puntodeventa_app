import 'package:flutter/material.dart';

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Productos',
          style: TextStyle( 
            fontWeight: FontWeight.bold,
            decorationThickness: 1.0,
            decorationColor: Colors.black,
          ),
        ),
        
        backgroundColor: Colors.blue,
        toolbarHeight: 80, // Duplica el tamaño del AppBar
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Productos'),
              onTap: null,
            ),
            ListTile(
              title: Text('Ventas'),
              onTap: null,
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.white,
      // body: Center(
      //   child: Container(
      //     padding: EdgeInsets.all(20),
      //     decoration: BoxDecoration(
      //       color: Colors.blue,
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Text(
      //       'Hola Mundo',
      //       style: TextStyle(
      //         fontSize: 24,
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
