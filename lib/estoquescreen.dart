import 'package:flutter/material.dart';

class EstoqueScreen extends StatefulWidget {
  @override
  _EstoqueScreenState createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 67, 40, 1),
        shadowColor: Colors.black,
        elevation: 4.0,
        title: Text('Estoque da Fazenda', style: TextStyle(color: Colors.white),),
      ),
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/imgs/agricultura.jpg', fit: BoxFit.cover),
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.40)),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Pesquisar Produto',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        // Borda quando o TextField está selecionado
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 246, 242, 30),
                            width: 2.0), // Alterar a cor e largura da borda
                        borderRadius: BorderRadius.circular(12)),
                  )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 111, 65, 0),
                            width: 1)),
                    backgroundColor: Color.fromARGB(235, 255, 255, 255),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
                child: Text('Buscar', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    );
  }
}
