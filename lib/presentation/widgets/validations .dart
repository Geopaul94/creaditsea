String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter an email address.';
  }
  RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (!emailRegex.hasMatch(email)) {
    return 'Please enter a valid email address.';
  }
  return null;
}





// pancard validation
String? validatePanCard(String? panCardNumber) {
  if (panCardNumber == null || panCardNumber.isEmpty) {
    return 'PAN card number cannot be empty.';
  }

  // Regular expression for PAN card validation
  final RegExp panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

  // Check if the entered PAN card number matches the pattern
  if (!panRegExp.hasMatch(panCardNumber)) {
    return 'Please enter a valid PAN card number.';
  }

  return null; // Return null if the PAN is valid
}






// password validator
String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter a password.';
  }
  if (!RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%#?&])[A-Za-z\d@$!%#?&]{8,}$')
      .hasMatch(password)) {
    return 'Password must be at least 8 characters long and \n contain at least one uppercase letter, one lowercase letter, \none number, and one special character.';
  }
  return null;
}

//phonenumber
String? validateMobileNumber(String? number) {
  if (number == null || number.isEmpty) {
    return 'Please enter a mobile number.';
  }

  final regex = RegExp(r'^\d{10}$');

  if (!regex.hasMatch(number)) {
    return 'Invalid mobile number format.';
  }

  return null;
}

// Username validator
String? validateUsername(String? username) {
  if (username == null || username.isEmpty) {
    return 'Please enter a username.';
  }
  if (username.length <= 3) {
    return 'Username must be more than 3 characters.';
  }
  return null;
}

// Confirm password validator
String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password.';
  }
  if (password != confirmPassword) {
    return 'Passwords do not match.';
  }
  return null;
}

String? validatePostdesctiption(String? username) {
  if (username == null || username.isEmpty) {
    return 'Please enter a Description.';
  }
  if (username.length <= 3) {
    return 'Description must be more than 3 characters.';
  }
  return null;
}

// Bio validator
String? validateBio(String? bio) {
  if (bio == null || bio.isEmpty) {
    return 'Please enter a bio.';
  }
  if (bio.length < 5) {
    return 'Bio must be at least 5 characters long.';
  }
  if (bio.length > 150) {
    return 'Bio must not exceed 150 characters.';
  }
  return null;
}