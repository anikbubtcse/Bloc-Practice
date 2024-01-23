import 'package:http/http.dart' as http;

class UniversityService {
  Future<http.Response> universityService() async {
    const String url =
        'http://universities.hipolabs.com/search?country=Bangladesh';
    Uri uri = Uri.parse(url);

    return await http.get(uri);
  }
}
