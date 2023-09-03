import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_album/models/album.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final albumRepostioryProvider =
    Provider((ref) => AlbumRepository(http.Client()));

class AlbumRepository {
  AlbumRepository(this.client);
  final http.Client client;
  final url = "https://jsonplaceholder.typicode.com/albums";

  Future<List<Album>> fetchAlbums() async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List parsedResponse = json.decode(response.body);
      return parsedResponse.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
