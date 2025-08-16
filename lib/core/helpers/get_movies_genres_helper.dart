import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

const String baseUrl = "https://yts.mx/api/v2/list_movies.json";
const int limit = 50;
const int maxPagesPerBatch = 20;

final Dio dio = Dio();

Future<Set<String>> fetchGenresBatch(int startPage, int endPage) async {
  final Set<String> batchGenres = <String>{};

  final futures = <Future<Response>>[];
  for (int page = startPage; page <= endPage; page++) {
    final String url = "$baseUrl?limit=$limit&page=$page";
    futures.add(dio.get(url));
  }

  final List<Response<dynamic>> responses = await Future.wait(futures);

  for (final response in responses) {
    if (response.statusCode == 200) {
      final data =
          response.data is String ? jsonDecode(response.data) : response.data;
      final movies = data["data"]["movies"];
      if (movies != null) {
        for (final movie in movies) {
          final List<dynamic>? genres = movie["genres"] as List<dynamic>?;
          if (genres != null) {
            batchGenres.addAll(genres.map((genre) => genre.toString()));
          }
        }
      }
    }
  }

  return batchGenres;
}

Future<Set<String>> getAllGenres() async {
  final Set<String> allGenres = <String>{};
  int page = 1;

  while (true) {
    log("Fetching page $page...");

    final Set<String> batchGenres = await fetchGenresBatch(
      page,
      page + maxPagesPerBatch - 1,
    );

    if (batchGenres.isEmpty) {
      break;
    }

    allGenres.addAll(batchGenres);
    page += maxPagesPerBatch;
  }

  return allGenres;
}

Future<void> main() async {
  final List<String> genresList = (await getAllGenres()).toList()..sort();
  final File file = File("genres.json");
  await file.writeAsString(JsonEncoder.withIndent('  ').convert(genresList));
  log("Saved ${genresList.length} genres to genres.json");
}
