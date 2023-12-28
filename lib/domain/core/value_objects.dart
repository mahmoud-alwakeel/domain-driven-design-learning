// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:domain_driven_design_learning_app/domain/auth/value_objects.dart';
import 'package:domain_driven_design_learning_app/domain/core/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;
  
  @override
  bool operator ==(covariant ValueObject<T> other) {
    if (identical(this, other)) return true;
  
    return 
      other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'value: $value';
 
}