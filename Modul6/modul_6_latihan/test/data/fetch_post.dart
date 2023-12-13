import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:modul_6_latihan/app/data/fetch_post.dart';
import 'package:modul_6_latihan/app/model/Posts.dart';
// import 'package:modul_6_latihan/app/services/posts_service.dart'; // Adjust this import based on your project structure

void main() {
  test('Fetch posts test', () async {
    // Arrange
    final client = http.Client();

    // Act
    final posts = await fetchPosts(client);

    // Assert
    expect(posts, isA<Posts>());
    // For example:
    expect(posts.title, isNotNull);
    expect(posts.userId, isNotNull);

    client.close();
  });
}
