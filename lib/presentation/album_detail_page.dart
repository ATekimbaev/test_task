import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:test_task/data/models/album_model_with_photos.dart';
import 'package:test_task/presentation/theme/app_colors.dart';
import 'package:test_task/presentation/theme/app_text_styles.dart';

import '../data/models/album_model.dart';

class AlbumDetailPage extends StatelessWidget {
  final AlbumModelWithPhotos album;
  const AlbumDetailPage({
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(album.title ?? ''),
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: album.photos?.length ?? 0,
          slideBuilder: (
            index,
          ) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                      album.photos?[index].url ?? '',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    album.photos?[index].title ?? '',
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
