import 'dart:convert';
import 'package:get/get.dart';
import 'package:hotstar/constent/constent_api.dart';
import 'package:hotstar/model/search_model.dart';
import 'package:hotstar/model/tvseries_model.dart';
import 'package:http/http.dart' as http;
import '../model/movie_model.dart';

class ApiController extends GetxController {
  // Observables
  var isLoading = false.obs;
 var trendingMovies = [].obs;
  var upcomingMovies = [].obs;
  var topRatedMovies = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    isLoading.value = true;

    try {
      trendingMovies.value = await getTrendingMovies();
      upcomingMovies.value = await getUpcomingMovies();
      topRatedMovies.value = await getTopRatedMovies();
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }
  // API Endpoints
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const popularUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const topRatedTvSeriesUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';
  static const popularTvSeriesUrl =
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';

  // Fetch Trending Movies
  Future<List<Movie>> getTrendingMovies() async {
    return await _fetchMovies(trendingUrl);
  }

  // Fetch Top Rated Movies
  Future<List<Movie>> getTopRatedMovies() async {
    return await _fetchMovies(topRatedUrl);
  }

  // Fetch Popular Movies
  Future<List<Movie>> getPopularMovies() async {
    return await _fetchMovies(popularUrl);
  }

  // Fetch Upcoming Movies
  Future<List<Movie>> getUpcomingMovies() async {
    return await _fetchMovies(upComingUrl);
  }

  // Fetch Now Playing Movies
  Future<List<Movie>> getNowPlayingMovies() async {
    return await _fetchMovies(nowPlayingUrl);
  }

  // Fetch Top Rated TV Series
  Future<List<TvSeries>> getTopRatedSeries() async {
    return await _fetchTvSeries(topRatedTvSeriesUrl);
  }

  // Fetch Popular TV Series
  Future<List<TvSeries>> getPopularSeries() async {
    return await _fetchTvSeries(popularTvSeriesUrl);
  }

  // Search for Movies
  Future<List<SearchMovie>> searchMovies(String value) async {
    final searchUrl =
        'https://api.themoviedb.org/3/search/movie?query=$value&include_adult=false&language=en-US&api_key=${Constants.apiKey}';

    return await _fetchSearchResults(searchUrl);
  }

  // Helper: Fetch Movies
  Future<List<Movie>> _fetchMovies(String url) async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(url));
      isLoading.value = false;

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  // Helper: Fetch TV Series
  Future<List<TvSeries>> _fetchTvSeries(String url) async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(url));
      isLoading.value = false;

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((tv) => TvSeries.fromJson(tv)).toList();
      } else {
        throw Exception('Failed to load TV series');
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  // Helper: Fetch Search Results
  Future<List<SearchMovie>> _fetchSearchResults(String url) async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(url));
      isLoading.value = false;

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData
            .map((movie) => SearchMovie.fromJson(movie))
            .where((movie) =>
                movie.posterPath != null && movie.posterPath.isNotEmpty)
            .toList();
      } else {
        throw Exception('Failed to fetch search results');
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}
