import 'package:flutter/material.dart';

class Ingresar extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'I N G R E S A R',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orange, Colors.red],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Colors.orange],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16), // Updated top padding
        child: Column(
          children: [
            const SizedBox(height: 40), // Updated height
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'ID',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Updated textfield_padding
              ),
            ),
            const SizedBox(height: 42),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Updated textfield_padding
              ),
            ),
            const SizedBox(height: 42),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Precio',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Updated textfield_padding
              ),
            ),
            const SizedBox(height: 40),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(
      onPressed: () {
        // Handle cancel action
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red, // Updated button color to red
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min, // Para que la fila tenga el tamaño de sus hijos
        children: <Widget>[
          Icon(
            Icons.close,
            color: Colors.white, // Cambia el color del ícono a blanco
          ),
          Text(' Cancelar'),
        ],
      ),
    ),
    ElevatedButton(
      onPressed: () {
        // Handle form submission
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Updated button color to blue
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min, // Para que la fila tenga el tamaño de sus hijos
        children: <Widget>[
          Icon(
            Icons.check,
            color: Colors.white, // Cambia el color del ícono a blanco
          ),
          Text(' Guardar'),
        ],
      ),
    ),
  ],
)
          ],
        ),
      ),
    );
  }
}
