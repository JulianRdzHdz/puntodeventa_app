import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
//import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

class Reportes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'R E P O R T E S',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.orange],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: ventas.length,
          itemBuilder: (context, index) {
            final venta = ventas[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    venta.hora,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                title: Text(
                  venta.fecha,
                  textAlign: TextAlign.center,
                ),
                trailing: Text(
                  '\$${venta.total.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black), // Set the text color to black
                ),
                onTap: () {
                  _showSaleDetails(context, venta);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSaleDetails(BuildContext context, Venta venta) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalles de la venta'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fecha: ${venta.fecha}'),
                SizedBox(height: 8),
                Text('Hora: ${venta.hora}'),
                SizedBox(height: 8),
                Text('Total: \$${venta.total.toStringAsFixed(2)}'),
                SizedBox(height: 8),
                ...venta.items.map((item) => Text(
                    '${item.cantidad} x ${item.nombre} - \$${item.precio}')),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.cancel), // Icono de cancelar
                      SizedBox(width: 8),
                      Text('Cancelar'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final pdf = pw.Document();

                    pdf.addPage(
                      pw.Page(
                        build: (pw.Context context) => pw.Column(
                          children: [
                            pw.Header(
                              level: 0,
                              child: pw.Text('Ticket de Venta',
                                  textAlign: pw.TextAlign.center),
                            ),
                            pw.Paragraph(text: 'Fecha: ${venta.fecha}'),
                            pw.Paragraph(text: 'Hora: ${venta.hora}'),
                            pw.Table.fromTextArray(
                              context: context,
                              data: <List<String>>[
                                <String>['Cantidad', 'Nombre', 'Precio'],
                                ...venta.items.map(
                                  (item) => [
                                    item.cantidad.toString(),
                                    item.nombre,
                                    '\$${item.precio}'
                                  ],
                                ),
                              ],
                            ),
                            pw.Paragraph(
                                text:
                                    'Total: \$${venta.total.toStringAsFixed(2)}'),
                            pw.Padding(
                                padding: const pw.EdgeInsets.only(top: 20)),
                            pw.Paragraph(text: 'Gracias por su compra!'),
                          ],
                        ),
                      ),
                    );

                    // Guardar el PDF en un archivo temporal
                    final output = await getTemporaryDirectory();
                    final file = File("${output.path}/Ticket.pdf");
                    await file.writeAsBytes(await pdf.save());

                    // Abrir el archivo PDF
                    OpenFile.open(file.path);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.print), // Icono de imprimir
                      Text('Generar Ticket'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// Las clases Venta e ItemVenta y la lista de ventas van aquí...

// Las clases Venta e ItemVenta y la lista de ventas van aquí...
class Venta {
  final String fecha;
  final String hora;
  final double total;
  final List<ItemVenta> items;

  Venta(
      {required this.fecha,
      required this.hora,
      required this.total,
      required this.items});
}

class ItemVenta {
  final String nombre;
  final double precio;
  final int cantidad;

  ItemVenta(
      {required this.nombre, required this.precio, required this.cantidad});
}

// Sample data
List<Venta> ventas = [
  Venta(
    fecha: '17-Feb-24',
    hora: '12:20',
    total: 100.0,
    items: [
      ItemVenta(nombre: 'Producto 1', precio: 20.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 2', precio: 30.0, cantidad: 2),
      ItemVenta(nombre: 'Producto 3', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 1', precio: 20.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 2', precio: 30.0, cantidad: 2),
      ItemVenta(nombre: 'Producto 3', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 1', precio: 20.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 2', precio: 30.0, cantidad: 2),
      ItemVenta(nombre: 'Producto 3', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 1', precio: 20.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 2', precio: 30.0, cantidad: 2),
      ItemVenta(nombre: 'Producto 3', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 1', precio: 20.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 2', precio: 30.0, cantidad: 2),
      ItemVenta(nombre: 'Producto 3', precio: 50.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  Venta(
    fecha: '18-Feb-24',
    hora: '13:30',
    total: 150.0,
    items: [
      ItemVenta(nombre: 'Producto 4', precio: 50.0, cantidad: 1),
      ItemVenta(nombre: 'Producto 5', precio: 100.0, cantidad: 1),
    ],
  ),
  // Agrega más ventas aquí...
];
