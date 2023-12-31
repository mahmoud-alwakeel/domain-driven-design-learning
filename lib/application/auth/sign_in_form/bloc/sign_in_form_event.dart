part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent{
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInFormEvent.paswordChanged(String passwordStr) = PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed(String emailStr) = RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signWithEmailAndPasswordPressed(String emailStr) = SignWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed(String emailStr) = SignInWithGooglePressed;


}