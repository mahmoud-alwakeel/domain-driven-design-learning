import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:domain_driven_design_learning_app/domain/auth/auth_failure.dart';
import 'package:domain_driven_design_learning_app/domain/auth/i_auth_facade.dart';
import 'package:domain_driven_design_learning_app/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(),
        );
      },
      paswordChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.signWithEmailAndPassword
          );
      },
      signWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(_authFacade.signWithEmailAndPassword);
      },
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
            isSubmitting: true, authFailureOrSuccessOption: none());
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },
    );
  }
  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAdress, 
      required Password password
      }) 
      forwardedCall,
  ) async*{
    Either<AuthFailure, Unit>? failureOrSuccess;
        final isEmailValid = state.emailAddress.isValid();
        final isPasswordValid = state.password.isValid();
        if (isEmailValid && isPasswordValid) {
          yield state.copyWith(
              isSubmitting: true, authFailureOrSuccessOption: none());
          failureOrSuccess = await forwardedCall(
            emailAdress: state.emailAddress,
            password: state.password,
          );
        }
        yield state.copyWith(
          isSubmitting: false,
            showErrorMessages: true, 
            authFailureOrSuccessOption: optionOf(failureOrSuccess));
  }
}
