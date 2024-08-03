

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
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
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