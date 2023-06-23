import 'package:firebase_core/firebase_core.dart';

class UserDataApiError implements Exception {
  final String message;

  UserDataApiError(this.message);

  factory UserDataApiError.fromFirebaseAuthException(
      FirebaseException exception) {
    print(exception.code);
    switch (exception.code) {
      case "permission-denied":
        return UserDataApiError("Permission denied.");
      case "object-not-found":
        return UserDataApiError("Data not found.");
      case "unauthenticated":
        return UserDataApiError("User not authenticated");
      case "unauthorized":
        return UserDataApiError("User not authorized");
      case "no-default-bucket":
        return UserDataApiError("No bucket established");
      default:
        return UserDataApiError("An undefined Error happened.");
    }
  }

  @override
  String toString() => message;
}
