import 'package:api_dio/models/character.dart';
import 'package:dio/dio.dart';

class ApiService{
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

final Dio _dio = Dio(BaseOptions(
  baseUrl: 'https://api.potterdb.com/v1/',
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
));

Future<List<Character>> getCharacters({int page = 1, int limit = 50})async {
  try {
    final response = await _dio.get(
      'characters',
      queryParameters: {
        'page[number]': page,
        'page[size]': limit,
      }
    );
    if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load characters');
      }
  } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  catch (e) {
    throw Exception('Unexpected error: $e');
  }
}

Future<Character> getCharacter(String id) async {
    try {
      final response = await _dio.get('characters/$id');
      
      if (response.statusCode == 200) {
        return Character.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load character');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}