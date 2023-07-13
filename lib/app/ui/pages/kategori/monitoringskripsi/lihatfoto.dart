import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class PhotoPage extends StatelessWidget {
  final String img;

  const PhotoPage({Key? key, required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider: CachedNetworkImageProvider(img),
    ));
  }
}
