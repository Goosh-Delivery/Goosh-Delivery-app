import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String _imageUrl;
  final double _width;
  final double _height;

  ImageView(this._imageUrl, this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Image.asset("assets/images/orange-half-circle.png",
                width: _width - 5, height: _height - 5, fit: BoxFit.cover),
          ),
          Align(
              alignment: Alignment(0, 0),
              child: Container(
                margin: EdgeInsets.only(top: 2, left: 8),
                width: _width - 15,
                height: _height - 15,
                decoration: BoxDecoration(
                    color: Color(0xffeeeeee), shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    _imageUrl,
                    width: _width,
                    height: _height,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                  // child: Image.asset(
                  //   _imageUrl,
                  //   width: _width,
                  //   height: _height,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ))
        ],
      ),
    );
  }
}
