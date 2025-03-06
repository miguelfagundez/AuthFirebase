class ValidationRules {
  static const emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  static var emailValidation = RegExp(emailPattern);
}
