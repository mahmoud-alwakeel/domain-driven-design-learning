// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain_driven_design_learning_app/domain/core/failures.dart';
import 'package:domain_driven_design_learning_app/domain/core/value_objects.dart';
import 'package:domain_driven_design_learning_app/domain/core/value_validators.dart';

class EmailAdress extends ValueObject<String>{
  final Either<ValueFailure<String>, String> value;
  
  factory EmailAdress(String input) {
    return EmailAdress._(
      validateEmailAdress(input)
    );
  }

  const EmailAdress._(this.value);
}

class Password extends ValueObject<String>{
  final Either<ValueFailure<String>, String> value;
  
  factory Password(String input) {
    return Password._(
      validatePassword(input)
    );
  }

  const Password._(this.value);
}




// void ShowEmailAdressOrFailure() {
//   final emailAdress = EmailAdress('aaa');

//   String emailText = emailAdress.value.fold(
//     (l) => 'some error happened : $l',
//     (r) => r);

//     // the coming one is a shorter way but we cant know the precise failure
//     String emailText2 = emailAdress.value.getOrElse(() => 'some error happened');
// }