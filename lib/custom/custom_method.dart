import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

class CustomMethod {
  static Either<ErrorType, String> dateTimeFormatter(String text) {
    try {
      String formattedDate =
          DateFormat('dd, MM, yyyy').format(DateTime.parse(text));
      return right(formattedDate);
    } catch (e) {
      return Left(ErrorType(errorMessage: e.toString()));
    }
  }
}

class ErrorType {
  String errorMessage;

  ErrorType({required this.errorMessage});
}
