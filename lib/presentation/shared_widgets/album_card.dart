import 'package:flutter/material.dart';

import '../../data/models/album_model.dart';
import '../../data/models/album_model_with_photos.dart';

class AlbumCard extends StatelessWidget {
  final AlbumModelWithPhotos album;

  const AlbumCard({
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size.width;
    final thumbSize = (mq - (16 * 2)) / 3;
    return Row(
      children: [
        Container(
          width: thumbSize,
          height: thumbSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                album.photos?.first.thumbnailUrl ?? '',
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(album.title ?? ''),
        ),
      ],
    );
  }
}
