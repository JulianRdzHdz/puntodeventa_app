import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Producto {
  int id;
  String nombre;
  int cantidad;
  double precio;

  Producto({
    required this.id,
    required this.nombre,
    required this.cantidad,
    required this.precio,
  });
}

class Almacen extends StatefulWidget {
  const Almacen({Key? key}) : super(key: key);

  @override
  _AlmacenState createState() => _AlmacenState();
}

class _AlmacenState extends State<Almacen> {
  final TextEditingController _busquedaController = TextEditingController();
  final TextEditingController _agregarController = TextEditingController();
  List<Producto> _productos = [];
  List<Producto> _productosFiltrados = [];

  @override
  void initState() {
    super.initState();
    _cargarProductos();
    _busquedaController.addListener(_filtrarProductos);
  }

  void _cargarProductos() {
    var box = Hive.box('products');
    List<Producto> productos = box.values.map((productoDb) {
      return Producto(
        id: productoDb['id'],
        nombre: productoDb['name'],
        cantidad: productoDb['quantity'],
        precio: productoDb['price'],
      );
    }).toList();
    setState(() {
      _productos = productos;
      _productosFiltrados = _productos;
    });
  }

  @override
  void dispose() {
    _busquedaController.dispose();
    _agregarController.dispose();
    super.dispose();
  }

  void _filtrarProductos() {
    setState(() {
      _productosFiltrados = _productos.where((producto) {
        return producto.nombre
                .toLowerCase()
                .contains(_busquedaController.text.toLowerCase()) ||
            producto.id.toString() == _busquedaController.text;
      }).toList();
    });
  }

  void _mostrarDialogo(Producto producto) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ID: ${producto.id}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nombre:'),
                  Text('Precio:'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    producto.nombre,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '\$${producto.precio}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Cantidad:'),
                      Text(
                        '${producto.cantidad}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text('Agregar:'),
                      SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _agregarController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                setState(() {
                  producto.cantidad += int.parse(_agregarController.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A L M A C E N'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _busquedaController,
              decoration: const InputDecoration(
                labelText: 'Buscar',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _productosFiltrados.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_productosFiltrados[index].nombre),
                  subtitle: Text(
                      '\$${_productosFiltrados[index].precio.toStringAsFixed(2)}'),
                  onTap: () => _mostrarDialogo(_productosFiltrados[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
