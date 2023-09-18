import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_album/models/photo.dart';
import 'package:friends_album/providers/photo_provider.dart';

class PhotoGallery extends ConsumerStatefulWidget {
  final int albumId;

  const PhotoGallery({Key? key, required this.albumId}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends ConsumerState<PhotoGallery> {
  @override
  void initState() {
    ref.read(photoProvider.notifier).loadPhotos(widget.albumId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Photo>? photos = ref.watch(photoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: photos == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: photos.length,
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Image.network(photos[index].thumbnailUrl),
                );
              },
            ),
    );
  }
}
