import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  // left side of either retuns failure
  // right side returns correct value
  Either<ValueFailure<T>, T> get value;
  // still not great.
  // on every use we have to check if failure is null or not
  //final Exception failure;

  /* does not have access to 'this'
  // a `factory function` returns an instance of a class
  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._constructor(
      validateEmailAddress(input),
    );
  }
  */

  // Do type validation in here not in UI.
  // Ensures that the object instance is valid throught its lifetime

  // named constructor to create an instance of `Email Address`
  //const EmailAddress._constructor(this.value);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
