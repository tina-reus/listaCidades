import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/model/cliente.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/material.dart';

class ConsultaCidade extends StatefulWidget {
  const ConsultaCidade({Key? key}): super(key: key);

  @override
  State<ConsultaCidade> createState() => _ConsultaCidadeState();
}

class _ConsultaCidadeState extends State<ConsultaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtUF = TextEditingController();
  List<Cidade> lista = [];

  @override
  Widget build(BuildContext context) {

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    editar() {
      AcessoApi().editarCidade;
      Navigator.of(context).pushReplacementNamed('/cadastro_cidade');
    }

    listarTodas() async {
      List<Cidade> cidade = await AcessoApi().listaCidades();
      setState(() {
        lista = cidade;
      });
    }

    buscar() async{
      String uf = txtUF.text;
      List<Cidade> cidade = await AcessoApi().listaCidadesPorUf(uf);
      setState(() {
        lista = cidade;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(TextInputType.text, "Estado", txtUF, "Informe o estado"),
            Componentes().criaBotao(formController, buscar, "Buscar cidades"),
            Componentes().criaBotao(formController, listarTodas, "Listar todas"),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Card(
                      color: (indice % 2 == 0) ? Colors.black : Colors.black12,
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: Componentes().criaItemCidade(lista[indice], editar),
                    );
                  }
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}