import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_album/models/album.dart';
import 'package:friends_album/providers/album_provider.dart';

class AlbumScreen extends ConsumerStatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends ConsumerState<AlbumScreen> {
  @override
  void initState() {
    ref.read(albumProvider.notifier).loadAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Album>? albums = ref.watch(albumProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: albums == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: albums.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(albums[index].title),
                  onTap: () {
                    // Navigate to album details page or do something on click
                  },
                );
              },
            ),
    );
  }
}
