import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';

class CategoriaRepository {
  Future<List<Categoria>> listarCategorias(
      {TipoTransacao? tipoTransacao}) async {
    final supabase = Supabase.instance;
    final data = await supabase.client
        .from("categorias")
        .select<List<Map<String, dynamic>>>();

    final categorias = data.map(
      (map) => Categoria(
        id: map['id'],
        descricao: map['descricao'],
        cor: Color(map['cor']),
        icone: IoniconsData(map['icone']),
        tipoTransacao: TipoTransacao.values[map['tipo_transacao']],
      ),
    ).toList();

    return categorias;

  }
}
