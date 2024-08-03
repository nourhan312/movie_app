

class UserCredentials {
  final String email;
  final String password;

  UserCredentials({
    required this.email,
    required this.password,
  });

  // Convert a UserCredentials instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  // Create a UserCredentials instance from a Map
  factory UserCredentials.fromJson(Map<String, dynamic> json) {
    return UserCredentials(
      email: json['email'],
      password: json['password'],
    );
  }
}