import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modul_4_prak/app/data/api/api_service.dart';
import 'package:modul_4_prak/app/modules/Dashboard/controllers/httpcontroller.dart';
import 'http_controller_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
// Constants for API details
  const _apiKey = '8849ce4f79484316bb3d4e00adfd54ef';
  const _baseUrl = 'https://newsapi.org/v2/';
  const String _category = 'business';
  const String _country = 'us';

  // Initialize ApiService and MockClient
  late HttpController httpController;
  late MockClient mockClient;

  setUp(() {
    // Set up MockClient and ApiService for each test
    mockClient = MockClient();
    httpController = HttpController();
  });

  group('ApiService', () {
    test('fetchArticles returns a list of articles if response is successful',
        () async {
      // Mock the HTTP response for successful case
      when(mockClient.get(Uri.parse(
              '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey')))
          .thenAnswer((_) async => http.Response(
              '{'
              '"status": "ok", '
              '"totalResults": 68, '
              '"articles": [], '
              '}',
              200)); // Mock the HTTP response

      final articles = await httpController.fetchArticles();

      // Expect the fetched data to be a list of Article objects
      expect(articles, isA<List<Article>>());
    });

    test('fetchArticles returns an empty list if response fails', () async {
      // Mock the HTTP response for response failure
      when(mockClient.get(Uri.parse(
              '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey')))
          .thenAnswer((_) async =>
              http.Response('Server error', 500)); // Mock the HTTP response

      final articles = await httpController.fetchArticles();

      // Expect the fetched data to be an empty list
      expect(articles, isA<List<Article>>());
    });

    test('fetchArticles returns an empty list if an error occurs', () async {
      // Mock an error response
      when(mockClient.get(Uri.parse(
              '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey')))
          .thenThrow(Exception('Test error')); // Mock an error

      final articles = await httpController.fetchArticles();

      // Expect the fetched data to be an empty list
      expect(articles, isA<List<Article>>());
    });
  });
}
