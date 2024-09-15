import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    prefixIcon: Icon(Icons.person_add),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Cadastrar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Já tem uma conta? Faça login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}