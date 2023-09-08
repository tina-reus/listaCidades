import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/material.dart';

class CadastroCidade extends StatefulWidget {
  const CadastroCidade({Key? key}) : super(key: key);

  @override
  State<CadastroCidade> createState() => _CadastroCidadeState();
}

class _CadastroCidadeState extends State<CadastroCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtUF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cadastrar() {
      Cidade c = 
        Cidade(0, txtNome.text, txtUF.text);
        if (c.id == 0) {
        AcessoApi().insereCidade(c.toJson());}
        else {AcessoApi().editarCidade(c.toJson(), c.id);}
        Navigator.of(context).pushReplacementNamed('/consulta_cidade');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(TextInputType.text, "Cidade", txtNome, "Informe o nome"),
            Componentes().criaInputTexto(TextInputType.text, "Estado", txtUF, "Informe o estado"),
            Componentes().criaBotao(formController, cadastrar, "Cadastrar"),
          ],
        ),
      ),
    );
  }
}