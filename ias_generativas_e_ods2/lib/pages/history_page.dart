import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/components/history_card.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';

import '../repository/photo_repository.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<PhotoModel> photos = PhotoRepository().findAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico"),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) => HistoryCard(photo: photos[index]),
      ),
    );
  }
}
