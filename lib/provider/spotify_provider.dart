import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_flutter/models/loading_enum.dart';

import 'package:spotify_flutter/models/singer_model.dart';
import 'package:spotify_flutter/models/song_model.dart';

class SpotifyProvider extends ChangeNotifier {
  final String baseUrl = "cryptic-forest-99443.herokuapp.com";
  final String basePath = "/api/v1";

  List<SingerModel> favoriteSingers = [];
  List<SongModel> madeforYou = [];
  List<SongModel> podcastdForYou = [];
  Map<String, List<SongModel>> allSongs = {};
  LoadPage loadPage = LoadPage.loading;

  SpotifyProvider() {
    getSingers();
    getSongs();
  }

  getSingers() async {
    final Map<String, String> query = {"page": "0", "limit": "26"};
    final responseData =
        await getResponseData(Uri.https(baseUrl, '$basePath/users', query));
    final body = jsonDecode(responseData.body);
    final singers = (body['results'] as List)
        .map<SingerModel>((s) => SingerModel.fromJson(s))
        .toList();
    favoriteSingers = singers.sublist(12, 18);
    loadPage = LoadPage.loaded;

    for (final singer in favoriteSingers) {
      getSongsBySinger(singer.username!);
    }

    notifyListeners();
    /** SETSTATE GLOBAL **/
  }

  getSongs() async {
    final query = {"limit": 30.toString()};
    final value = await getResponseData(Uri.https(
      baseUrl,
      '$basePath/songs/random/all',
      query,
    ));

    final body = jsonDecode(value.body);

    final songs = (body['results'] as List)
        .map((user) => SongModel.fromJson(user))
        .toList();
    loadPage = LoadPage.loaded;
    podcastdForYou = songs.sublist(0, 6);
    madeforYou = songs.sublist(6, 12);
    notifyListeners();
  }

  Future<List<SingerModel>> getSearchSingers(String tag) async {
    final query = {
      "page": 0.toString(),
      "limit": 50.toString(),
      "q": tag,
    };

    final res = await getResponseData(
        Uri.https(baseUrl, '$basePath/search/artists', query));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return (body['results'] as List)
          .map((e) => SingerModel.fromJson(e))
          .toList();
    } else {
      throw Exception("failed fetch users ");
    }
  }

  Future<List<SongModel>> getSearchSongs(String tag) async {
    final query = {
      "page": 0.toString(),
      "limit": 50.toString(),
      "q": tag,
    };

    final res = await getResponseData(
        Uri.https(baseUrl, '$basePath/search/songs', query));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      return (body['results'] as List)
          .map((e) => SongModel.fromJson(e))
          .toList();
    } else {
      throw Exception("failed fetch users ");
    }
  }

  Future<SingerModel> getSingerById(String id) async {
    final value =
        await getResponseData(Uri.https(baseUrl, '$basePath/user/$id'));

    if (value.statusCode == 200) {
      final body = jsonDecode(value.body);

      return SingerModel.fromJson(body['results']);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<SongModel>> getSongsbySingerId(String id) async {
    final value =
        await getResponseData(Uri.https(baseUrl, '$basePath/songs/$id', {
      "page": 0.toString(),
      "limit": 100.toString(),
    }));
    if (value.statusCode == 200) {
      final body = jsonDecode(value.body);
      return ((body['results'] as List)
          .map((e) => SongModel.fromJson(e))
          .toList());
    } else {
      throw Exception('Failed to load data');
    }
  }

  getSongsBySinger(String username) async {
    final value =
        await getResponseData(Uri.https(baseUrl, '$basePath/songs/$username', {
      "page": 0.toString(),
      "limit": 100.toString(),
    }));

    final body = jsonDecode(value.body);

    final songs =
        ((body['results'] as List).map((e) => SongModel.fromJson(e)).toList());

    if (songs.length > 14) {
      allSongs[username] = songs.sublist(0, 14);
    } else {
      allSongs[username] = songs;
    }
  }

  getResponseData(Uri url) async {
    final responseData = await http.get(url);
    return responseData;
  }
}
