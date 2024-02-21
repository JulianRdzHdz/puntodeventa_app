import 'package:flutter/material.dart';
import 'ventana2.dart';
import 'productos.dart';

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
        title: const Text(
          'Punto de Venta',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decorationThickness: 1.0,
            decorationColor: Colors.black,
          ),
        ),
        backgroundColor: Colors.blue,
        toolbarHeight: 80, // Duplica el tamaño del AppBar
      ),
      body: GridView.count(
        crossAxisCount: 2, // Cambia el número de columnas a 2
        childAspectRatio: 1, // Ajusta el tamaño de los cuadros
        children: <Widget>[
          
          //P R O D U C T O S
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Productos()),
              );
            },
            child: Container(
              color: Colors.purple,
              child: const Center(
                child: Text(
                  'P R O D U C T O S',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),


          //V E N T A S
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ventana2()),
              );
            },
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  'V E N T A S',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),


          //A L M A C E N
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ventana2()),
              );
            },
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  'A L M A C E N',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),

          //R E P O R T E S
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ventana2()),
              );
            },
            child: Container(
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'R E P O R T E S',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          
          
        ],
      ),
    );
  }
}