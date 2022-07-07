
import 'package:flutter/material.dart';

class ImageFromURL extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageFromURL({Key key, @required this.url, @required this.width, @required this.height, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Image.network(
      url,
      fit: fit,
      width: width,
      height: height,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: width,
          height: height,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                  : null,
            ),
          ),
        );
      },
    );
  }
}
