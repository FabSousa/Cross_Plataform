import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';
import 'package:ias_generativas_e_ods2/pages/details_page.dart';

class PhotoCard extends StatelessWidget {
  final PhotoModel photo;

  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsPage.routeName,
          arguments: photo,
        );
      },
      child: GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(4),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(photo.id.toString()),
          ),
        ),
        child: photo.image,
      ),
    );
  }
}
