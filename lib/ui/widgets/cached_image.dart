import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;

  CachedImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (ctx, url) => Center(
        child: CircularProgressIndicator(),
        widthFactor: 24,
        heightFactor: 24,
      ),
      errorWidget: (ctx, url, error) => Center(
        child: Icon(
          Icons.warning,
          color: Colors.red,
        ),
      ),
      progressIndicatorBuilder: (ctx, url, progress) => Center(
        widthFactor: 24,
        heightFactor: 24,
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      fit: BoxFit.cover,
    );
  }
}
