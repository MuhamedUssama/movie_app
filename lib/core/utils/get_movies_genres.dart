import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

const String baseUrl = "https://yts.mx/api/v2/list_movies.json";
const int limit = 50;

final Dio dio = Dio();

Future<Set<String>> getGenres() async {
  final Set<String> genresSet = <String>{};
  int page = 1;

  while (true) {
    log("Fetching page $page...");
    final String url = "$baseUrl?limit=$limit&page=$page";

    try {
      final Response response = await dio.get(url);

      if (response.statusCode != 200) {
        log("Error fetching data");
        break;
      }

      final data =
          response.data is String ? jsonDecode(response.data) : response.data;

      final movies = data["data"]["movies"];
      if (movies == null || movies.isEmpty) {
        break;
      }

      for (final movie in movies) {
        final genres = movie["genres"] as List<dynamic>?;
        if (genres != null) {
          genresSet.addAll(genres.map((genre) => genre.toString()));
        }
      }

      page++;
      await Future.delayed(Duration(milliseconds: 200));
    } catch (e) {
      log("Request error: $e");
      break;
    }
  }

  return genresSet;
}

Future<void> main() async {
  final List<String> genresList = (await getGenres()).toList()..sort();
  final File file = File("genres.json");
  await file.writeAsString(JsonEncoder.withIndent('  ').convert(genresList));
  log("Saved ${genresList.length} genres to genres.json");
}
