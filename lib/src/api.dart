import 'package:http/http.dart' as http;
import 'config.dart';

class ApiClient extends http.BaseClient {
  final http.Client _httpClient = http.Client();
  final String _baseUrl = Config.backendServiceEndpoint;

  ApiClient();

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Uri url(String path, [Map<String, String?>? queryParameters]) {
    return Uri.parse('$_baseUrl$path')
        .replace(queryParameters: queryParameters);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(requestHeaders);
    return _httpClient.send(request);
  }
}
