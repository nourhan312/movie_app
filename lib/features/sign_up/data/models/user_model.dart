

class User {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String image;

  static const String defaultImage = 'assets/images/profile_image.jpg';

  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    this.image = defaultImage,
  });

  // Convert a User instance to a Map
  static Map<String, dynamic> toJson(User user) {
    return {
      'name': user.name,
      'phone': user.phone,
      'email': user.email,
      'password': user.password,
      'image': '',
    };
  }

  // Create a User instance from a Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      image: json['image'] ?? defaultImage,
    );
  }
}