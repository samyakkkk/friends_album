import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_album/models/photo.dart';

final photoRepositoryProvider =
    Provider((ref) => PhotoRepository(http.Client()));

class PhotoRepository {
  PhotoRepository(this.client);
  final http.Client client;
  final baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Photo>> getPhotosForAlbum(int albumId) async {
    final url = Uri.parse('$baseUrl/albums/$albumId/photos');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List parsedResponse = json.decode(response.body);
      return parsedResponse.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
