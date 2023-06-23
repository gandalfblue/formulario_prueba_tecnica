import 'package:firebase_auth/firebase_auth.dart';

class AuthUserDataApiError implements Exception {
  final String message;

  AuthUserDataApiError(this.message);

  factory AuthUserDataApiError.fromFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case "user-not-found":
        return AuthUserDataApiError("User not found.");
      case "wrong-password":
        return AuthUserDataApiError("Invalid credentials.");
      case "email-already-in-use":
        return AuthUserDataApiError("Email already in use.");
      default:
        return AuthUserDataApiError("An undefined Error happened.");
    }
  }

  @override
  String toString() => message;
}
