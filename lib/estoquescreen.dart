import 'package:flutter/material.dart';
import 'package:flutter_application_1/db_helper.dart';

class EstoqueScreen extends StatefulWidget {
  @override
  _EstoqueScreenState createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _resultadoBusca = '';

  void _buscarItem() async {
    final dbHelper = DBHelper();
    final item = await dbHelper.buscarItem(_searchController.text);

    setState(() {
      if (item != null) {
        _resultadoBusca = 'Item: ${item['item']}, Quantidade: ${item['quantity']}';
      } else {
        _resultadoBusca = 'Item não encontrado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque da Fazenda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar Item',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _buscarItem,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Buscar'),
            ),
            SizedBox(height: 20),
            Text(
              _resultadoBusca,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}