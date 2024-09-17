import 'package:flutter/material.dart';
import 'package:flutter_application_1/cadastroscreen.dart';
import 'package:flutter_application_1/estoquescreen.dart';
import 'package:path/path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                Image.asset('assets/imgs/agricultura.jpg', fit: BoxFit.cover),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.40),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 150),
                  Positioned(
                    top: 50, // Posição do topo da tela
                    left: MediaQuery.of(context).size.width / 2 - 100,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/imgs/tech.png'),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
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
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
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
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EstoqueScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: const Color.fromARGB(255, 111, 65, 0),
                                width: 1)),
                        backgroundColor: Color.fromARGB(235, 255, 255, 255),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
                    child: Text('Entrar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CadastroScreen()),
                      );
                    },
                    child: Text('Não tem uma conta? Cadastre-se'),
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("Fazenda Tech 2024 ©", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),)],
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
