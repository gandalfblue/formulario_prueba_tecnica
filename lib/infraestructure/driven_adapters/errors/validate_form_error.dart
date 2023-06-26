class ValidationFormException implements Exception {
  final String message;

  ValidationFormException(this.message);

  factory ValidationFormException.fromException(
      ValidationFormException exception) {
    switch (exception.message) {
      case "error-isEmpty":
        return ValidationFormException("The field is required.");
      case "error-isNumber":
        return ValidationFormException("The field required is to String.");
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
