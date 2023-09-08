import 'dart:convert';

import 'package:consumo_api/model/cidade.dart';
import 'package:consumo_api/model/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AcessoApi {
  Future<List<Cliente>> listaClientes() async {
    String url = 'http://localhost:8080/cliente';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cliente> clientes = List<Cliente>.from(l.map((c) => Cliente.fromJson(c)));
    return clientes;
  }

  Future<List<Cidade>> listaCidades() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<void> insereCliente(Map<String, dynamic> cliente) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response resposta = await post(Uri.parse(url), headers : headers, body : json.encode(cliente));
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response resposta = await post(Uri.parse(url), headers : headers, body : json.encode(cidade));
  }

  Future<void> excluirCliente(int id) async {
    String url = 'http://localhost:8080/cliente/$id';
    await delete(Uri.parse(url));
  }

  Future<void> excluirCidade(int id) async {
    String url = 'http://localhost:8080/cidade/$id';
    await delete(Uri.parse(url));
  }

  Future<void> editarCliente(Map<String, dynamic> cliente) async {
    String url = 'http://localhost:8080/client';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response resposta = await put(Uri.parse(url), headers : headers, body : json.encode(cliente));
  }

  Future<void> editarCidade(Map<String, dynamic> cidade, id) async {
    String url = 'http://localhost:8080/cidade?id=${id}';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response resposta = await put(Uri.parse(url), headers : headers, body : json.encode(cidade));
  }

   Future<List<Cliente>> listaClientesPorCidade(String cidade) async {
    String url = 'http://localhost:8080/cliente/buscarporcidade/$cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cliente> clientes = List<Cliente>.from(l.map((c) => Cliente.fromJson(c)));
    return clientes;
  }

  Future<List<Cidade>> listaCidadesPorUf(String uf) async {
    String url = 'http://localhost:8080/cidade/buscauf/$uf';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

}