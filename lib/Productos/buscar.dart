import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {
  final TextEditingController idController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'B U S C A R',
            style: TextStyle(
              color: Colors.white, 
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
                colors: [Colors.indigo, Colors.blue], // Updated colors
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.indigo], // Updated colors
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16), // Updated top padding
          child: Column(
            children: [
              const SizedBox(height: 20), // Updated height
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        labelText: 'ID/NOMBRE/PRECIO',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Updated textfield_padding
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle search action
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30, // Updated icon size
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
                          const Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // Product 1
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('1'),
                                    ),
                                    title: Text(
                                      'Product 1',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$10.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 2
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('2'),
                                    ),
                                    title: Text(
                                      'Product 2',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$20.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 3
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('3'),
                                    ),
                                    title: Text(
                                      'Product 3',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$30.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 4
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('4'),
                                    ),
                                    title: Text(
                                      'Product 4',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$40.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 5
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('5'),
                                    ),
                                    title: Text(
                                      'Product 5',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$50.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 6
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('6'),
                                    ),
                                    title: Text(
                                      'Product 6',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$60.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 7
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('7'),
                                    ),
                                    title: Text(
                                      'Product 7',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$70.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 8
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('8'),
                                    ),
                                    title: Text(
                                      'Product 8',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$80.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 9
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('9'),
                                    ),
                                    title: Text(
                                      'Product 9',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$90.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                  // Product 10
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white, // Updated circle color
                                      child: Text('10'),
                                    ),
                                    title: Text(
                                      'Product 10',
                                      style: TextStyle(fontWeight: FontWeight.bold), // Updated product name style
                                    ),
                                    trailing: Text(
                                      '\$100.00',
                                      style: TextStyle(fontSize: 18, color: Colors.black), // Updated price style
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
