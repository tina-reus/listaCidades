import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/model/cliente.dart';
import 'package:consumo_api/util/combo_cidade.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:consumo_api/util/radio_sexo.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cadastrar() {
      Cliente c = 
        Cliente(0, txtNome.text, txtSexo.text, int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "", ""));
        if (c.id == 0) {
         AcessoApi().insereCliente(c.toJson());}
        else {AcessoApi().editarCliente(c.toJson());}
        Navigator.of(context).pushReplacementNamed('/consulta');
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
            Componentes().criaInputTexto(TextInputType.text, "Nome", txtNome, "Informe o nome"),
            Componentes().criaInputTexto(TextInputType.text, "Idade", txtIdade, "Informe a idade"),
            Center(child: RadioSexo(controller: txtSexo)),
            Center(child: ComboCidade(controller: txtCidade)),
            Componentes().criaBotao(formController, cadastrar, "Cadastrar"),
          ],
        ),
      ),
    );
  }
}