import 'package:dartz/dartz.dart';
import 'package:domain_driven_design_learning_app/domain/auth/auth_failure.dart';
import 'package:flutter/foundation.dart';

import 'value_objects.dart';
// whatever starts with I is going to have only an innterface and there is no implentation 
abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAdress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signWithEmailAndPassword({
    required EmailAddress emailAdress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();  
}