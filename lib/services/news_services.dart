import 'package:http/http.dart' as http;

class NewsServices {
  final myApiKey = "d1aa92588762442d85e519ebffb77561";
  final url = "https://newsapi.org/v2/everything?q=tesla&from=2023-03-24&sortBy=publishedAt&apiKey=d1aa92588762442d85e519ebffb77561";

  Future<http.Response> getAllNews() async {
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
    );
    return response;
  }
}
