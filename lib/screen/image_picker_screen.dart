import 'package:flutter/material.dart';
import 'package:flutter_cameraapp/model/camera_model.dart';

import 'package:provider/provider.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<CameraModel>(context);
    return ElevatedButton(
      onPressed: () {
        testProvider.getImageFromCamera();
      },
      child: Text('撮影を行う'),
    );
  }
}

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<CameraModel>(context);
    return ElevatedButton(
      onPressed: () {
        testProvider.getImageFromGallery();
      },
      child: Text("写真を取り込む"),
    );
  }
}
