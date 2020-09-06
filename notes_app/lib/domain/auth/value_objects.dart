import 'package:dartz/dartz.dart';
import 'package:notes_app/domain/core/failures.dart';
import 'package:notes_app/domain/core/value_objects.dart';
import 'package:notes_app/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  // left side of either retuns failure
  // right side returns correct value
  final Either<ValueFailure<String>, String> value;
  // still not great.
  // on every use we have to check if failure is null or not
  //final Exception failure;

  // does not have access to 'this'
  // a `factory function` returns an instance of a class
  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._constructor(
      validateEmailAddress(input),
    );
  }

  // Do type validation in here not in UI.
  // Ensures that the object instance is valid throught its lifetime

  // named constructor to create an instance of `Email Address`
  const EmailAddress._constructor(this.value);
}

//class InvalidEmailException implements Exception {
//  final String failedValue;
//InvalidEmailException({@required this.failedValue});
//}

//void f() {
// with exceptions that has been commented out above
// trys and specific catches would constantly have to written in code
// Instead we add faiulres
//
//try {
//  EmailAddress('fafdds');
//} on InvalidEmailException catch (e) {
// do something
//}
//}

/*
void showEmailAddressOrFailure() {
  final email = EmailAddress('jshdfjhsd');
  // option 1
  String emailText = email.value.fold(
    (left) => 'Failure: $left',
    (right) => right,
  );

  // option 2
  String emailText = email.value.getOrElse(() => 'Some failure (no specifics)');
}
*/

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;
  factory Password(String input) {
    assert(input != null);
    return Password._constructor(
      validatePassword(input),
    );
  }
  const Password._constructor(this.value);
}
