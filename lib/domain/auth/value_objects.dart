// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain_driven_design_learning_app/domain/core/failures.dart';
import 'package:domain_driven_design_learning_app/domain/core/value_objects.dart';
import 'package:domain_driven_design_learning_app/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String>{
  final Either<ValueFailure<String>, String> value;
  
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAdress(input)
    );
  }

  const EmailAddress._(this.value);
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
//   final emailAdress = EmailAddress('aaa');

//   String emailText = emailAdress.value.fold(
//     (l) => 'some error happened : $l',
//     (r) => r);

//     // the coming one is a shorter way but we cant know the precise failure
//     String emailText2 = emailAdress.value.getOrElse(() => 'some error happened');
// }