import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_album/models/photo.dart';
import 'package:friends_album/repositories/photo_repository.dart';

final photoProvider = StateNotifierProvider<PhotoNotifier, List<Photo>?>(
    (ref) => PhotoNotifier(null,
        photoRepository: ref.read(photoRepositoryProvider)));

class PhotoNotifier extends StateNotifier<List<Photo>?> {
  PhotoNotifier(super.state, {required this.photoRepository});

  final PhotoRepository photoRepository;

  Future<void> loadPhotos(int albumId) async {
    final photos = await photoRepository.getPhotosForAlbum(albumId);
    state = photos;
  }
}
