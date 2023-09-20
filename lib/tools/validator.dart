

class PasswordValidationResult {
  bool isValid;
  String error;

  PasswordValidationResult({required this.isValid, this.error = ""});
}

PasswordValidationResult validatePassword(String password) {
  // Check if the password is at least 8 characters long
  if (password.length < 8) {
    return PasswordValidationResult(
        isValid: false, error: "Password must be at least 8 characters long");
  }

  // Check if the password contains at least one lowercase letter
  if (!password.contains(RegExp(r'[a-z]'))) {
    return PasswordValidationResult(
        isValid: false, error: "Password must contain a lowercase letter");
  }

  // Check if the password contains at least one uppercase letter
  if (!password.contains(RegExp(r'[A-Z]'))) {
    return PasswordValidationResult(
        isValid: false, error: "Password must contain an uppercase letter");
  }

  // Check if the password contains at least one digit
  if (!password.contains(RegExp(r'\d'))) {
    return PasswordValidationResult(
        isValid: false, error: "Password must contain a digit");
  }

  // Check if the password contains at least one special character
  if (!password.contains(RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\\-]'))) {
    return PasswordValidationResult(
        isValid: false, error: "Password must contain a special character");
  }

  // If all checks pass, the password is valid
  return PasswordValidationResult(isValid: true);
}



class EmailValidationResult {
  bool isValid;
  String error;

  EmailValidationResult({required this.isValid, this.error = ""});
}

EmailValidationResult validateEmail(String email) {
  // Define a regular expression pattern for email validation
  final emailPattern = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  // Check if the email matches the regular expression pattern
  if (!emailPattern.hasMatch(email)) {
    return EmailValidationResult(
        isValid: false, error: "Invalid email address format");
  }

  // If the email is valid, return a valid result
  return EmailValidationResult(isValid: true);
}




class UsernameValidationResult {
  bool isValid;
  String error;

  UsernameValidationResult({required this.isValid, this.error = ""});
}

UsernameValidationResult validateUsername(String username) {
  // Check if the username is not empty
  if (username.isEmpty) {
    return UsernameValidationResult(
        isValid: false, error: "Username cannot be empty");
  }

  // Check if the username contains only alphanumeric characters and underscores
  if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
    return UsernameValidationResult(
        isValid: false,
        error: "Username can only contain letters, numbers, and underscores");
  }

  // Check if the username is between 3 and 20 characters long
  if (username.length < 3 || username.length > 20) {
    return UsernameValidationResult(
        isValid: false,
        error: "Username must be between 3 and 20 characters long");
  }

  // If the username passes all checks, it is valid
  return UsernameValidationResult(isValid: true);
}