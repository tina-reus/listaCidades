import 'package:consumo_api/paginas/consultaCidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super (key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    cadastro() {
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }
    consulta() {
      Navigator.of(context).pushReplacementNamed('/consulta');
    }
    cadastroCidade() {
      Navigator.of(context).pushReplacementNamed('/cadastro_cidade');
    }
    consultaCidade() {
      Navigator.of(context).pushReplacementNamed('/consulta_cidade');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaBotao(formController, cadastro, "Cadastro Pesssoa"),
            Componentes().criaBotao(formController, consulta, "Consulta Pesssoa"),
            Componentes().criaBotao(formController, cadastroCidade, "Cadastro Cidade"),
            Componentes().criaBotao(formController, consultaCidade, "Consulta Cidade"),
          ],
        ),
      ),
    );
  }
}