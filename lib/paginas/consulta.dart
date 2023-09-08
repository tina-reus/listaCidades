import 'package:consumo_api/api/acesso_api.dart';
import 'package:consumo_api/model/cliente.dart';
import 'package:consumo_api/util/componentes.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  const Consulta({Key? key}): super(key: key);

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();
  List<Cliente> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Cliente> clientes = await AcessoApi().listaClientes();
      setState(() {
        lista = clientes;
      });
    }

    buscar() async{
      String cidade = txtCidade.text;
      List<Cliente> cliente = await AcessoApi().listaClientesPorCidade(cidade);
      setState(() {
        lista = cliente;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(TextInputType.text, "Cidade", txtCidade, "Informe a cidade"),
            Componentes().criaBotao(formController, buscar, "Buscar cliente"),
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
                      child: Componentes().criaItemCliente(lista[indice]),
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