import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/correntista.dart';

class CorrentistaRepository {
  Future<List<Correntista>> listarCorrentistas({contaId}) async {
    final supabase = Supabase.instance.client;
    final data = await supabase
        .from('correntistas')
        .select<List<Map<String, dynamic>>>()
        .eq('conta_id', contaId);

    final correntista = data.map((e) => Correntista.fromMap(e)).toList();

    return correntista;
  }

  Future cadastrarCorrentista(Correntista correntista) async {
    final supabase = Supabase.instance.client;

    await supabase.from('correntistas').insert({
      'conta_id': correntista.contaId,
      'nome': correntista.nome,
      'cpf': correntista.cpf,
      'email': correntista.email,
      'celular': correntista.celular,
    });
  }

  Future alterarCorrentista(Correntista correntista) async {
    final supabase = Supabase.instance.client;

    await supabase.from('correntistas').update({
      'conta_id': correntista.contaId,
      'nome': correntista.nome,
      'cpf': correntista.cpf,
      'email': correntista.email,
      'celular': correntista.celular,
    }).match({'id': correntista.id});
  }

  Future excluirCorrentista(int id) async {
    final supabase = Supabase.instance.client;

    await supabase.from('correntistas').delete().match({'id': id});
  }
}
