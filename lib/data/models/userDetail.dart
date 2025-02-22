class UserDetails {
  String? userId; // Unique identifier for the user (optional)
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? dateOfBirth;
  String? gender;
  String? maritalStatus;
  String? panCard;
  int? phoneNumber;

  // Constructor with optional parameters
  UserDetails({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.dateOfBirth,
    this.gender,
    this.maritalStatus,
    this.panCard,
    this.phoneNumber,
  });

  // Convert a UserDetails object into a Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'panCard': panCard,
      'phoneNumber': phoneNumber,
    };
  }

  // Create a UserDetails object from a Map (from Firestore)
  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      userId: map['userId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      dateOfBirth: map['dateOfBirth'],
      gender: map['gender'],
      maritalStatus: map['maritalStatus'],
      panCard: map['panCard'],
      phoneNumber: map['phoneNumber']?.toInt(), // Ensure phone number is an integer
    );
  }
}