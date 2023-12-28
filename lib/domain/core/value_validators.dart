import 'package:dartz/dartz.dart';
import 'package:domain_driven_design_learning_app/domain/auth/value_objects.dart';
import 'package:domain_driven_design_learning_app/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAdress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPaswword(failedValue: input));
  }
}
