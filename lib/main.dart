import 'package:consumo_api/paginas/cadastro.dart';
import 'package:consumo_api/paginas/cadastroCidade.dart';
import 'package:consumo_api/paginas/consulta.dart';
import 'package:consumo_api/paginas/consultaCidade.dart';
import 'package:consumo_api/paginas/home.dart';
import 'package:consumo_api/util/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/consulta':(context) => const Consulta(),
        '/cadastro':(context) => const Cadastro(),
        '/cadastro_cidade':(context) => const CadastroCidade(),
        '/consulta_cidade':(context) => const ConsultaCidade(),
      },
    );
  }
}