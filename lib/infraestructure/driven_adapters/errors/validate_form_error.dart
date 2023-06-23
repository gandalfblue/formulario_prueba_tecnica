class ValidationFormException implements Exception {
  final String message;

  ValidationFormException(this.message);

  factory ValidationFormException.fromException(
      ValidationFormException exception) {
    switch (exception.message) {
      case "name-isEmpty":
        return ValidationFormException("The Name field is required.");
      case "lastname-isEmpty":
        return ValidationFormException("The Last Name field is required.");
      case "birthdate-isEmpty":
        return ValidationFormException("The Date of Birth field is required.");
      case "address-isEmpty":
        return ValidationFormException("You must add at least one address.");
      default:
        return ValidationFormException("Error not specifically");
    }
  }

  @override
  String toString() {
    return 'ValidationException: $message';
  }
}
