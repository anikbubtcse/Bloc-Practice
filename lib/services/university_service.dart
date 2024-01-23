import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class UniversityService {
  Future<Either<Failure, http.Response>> universityService() async {
    try {
      const String url =
          'http://universities.hipolabs.com/search?country=Bangladesh';
      Uri uri = Uri.parse(url);

      final response = await http.get(uri);
      return Right(response);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}

class Failure {
  String errorMessage;

  Failure({required this.errorMessage});
}
