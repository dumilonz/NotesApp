// only an interface
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_app/domain/auth/value_objects.dart';

import 'auth_failure.dart';

// FirebaseAuth, GoogleSignIn

abstract class IAuthFacade {
  // Unit is an empty tuple. Void function with more functionality
  // These functions either return a Failure or an empty Unit
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
