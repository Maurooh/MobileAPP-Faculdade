import 'package:flutter/material.dart';
import 'package:flutter_application_1/estoquescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;


class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centraliza verticalmente
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo centralizado no topo
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/imgs/tech.png'),
                    ),
                    SizedBox(height: 30), // Espaço entre o logo e o TextField

                    // Campo de usuário
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Por favor, digite seu e-mail.';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
                          return 'Por favor, digite um e-mail correto';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Cadastrar E-mail',
                        prefixIcon: Icon(Icons.person_add, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 246, 242, 30),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Campo de senha
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      validator: (senha){
                        if (senha == null || senha.isEmpty){
                          return "Por favor, digite uma senha.";
                        }else if(senha.length <= 6){
                          return "Por favor, digite uma senha maior que 6 caracteres.";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Nova Senha',
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 246, 242, 30),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),

                    // Campo de confirmar senha
                    TextFormField(
                      controller: _passwordController2,
                      keyboardType: TextInputType.text,
                      validator: (senha){
                        if (senha == null || senha.isEmpty){
                          return "Por favor, digite uma senha.";
                        }else if(senha.length <= 6){
                          return "Por favor, digite uma senha maior que 6 caracteres.";
                        }else if(senha != _passwordController){
                          return("Por favor, digite senhas iguais.");
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Confirmar Senha',
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 246, 242, 30),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 30),

                    // Botão de entrar
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
                            width: 1,
                          ),
                        ),
                        backgroundColor: Color.fromARGB(235, 255, 255, 255),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Text('Entrar'),
                    ),
                    SizedBox(height: 20),

                    // Botão de já tem uma conta?
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Já tem uma conta? Faça login'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Fazenda Tech 2024 ©",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    Future<bool> cadastro() async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    }
  }
}
