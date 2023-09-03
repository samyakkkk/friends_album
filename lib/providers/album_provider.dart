import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_album/models/album.dart';
import 'package:friends_album/repositories/album_repository.dart';

final albumProvider = StateNotifierProvider<AlbumsNotifier, List<Album>?>(
    (ref) => AlbumsNotifier(null,
        albumRepository: ref.read(albumRepostioryProvider)));

class AlbumsNotifier extends StateNotifier<List<Album>?> {
  AlbumsNotifier(super.state, {required this.albumRepository});

  final AlbumRepository albumRepository;

  Future<void> loadAlbums() async {
    final albums = await albumRepository.fetchAlbums();
    state = albums;
  }
}
