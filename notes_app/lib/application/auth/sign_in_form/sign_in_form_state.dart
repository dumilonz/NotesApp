part of 'sign_in_form_bloc.dart';

// decide what ui states can be
// sign in with email\
// register with email
// sign in with google

@freezed
abstract class SignInFormState with _$SignInFormState {
  // What do we need to communicate back to the  UI from the sign in form
  // communicate back to the UI the validated Email and the Validated password
  const factory SignInFormState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    // when you click the button there is no response yet (no auth failure or success)
    // can use 'option' with is an non-null-able type
    // Option<None, Some>
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
