class MovieReviewPage {
  final int id;
  final int page;
  final List<Review> results;
  final int totalPages;
  final int totalResults;

  MovieReviewPage({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieReviewPage.fromJson(Map<String, dynamic> json) {
    return MovieReviewPage(
      id: json['id'],
      page: json['page'],
      results:
          List<Review>.from(json['results'].map((x) => Review.fromJson(x))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Review {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;
  final String url;

  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'],
      authorDetails: AuthorDetails.fromJson(json['author_details']),
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
      updatedAt: DateTime.parse(json['updated_at']),
      url: json['url'],
    );
  }
}

class AuthorDetails {
  final String name;
  final String username;
  final String? avatarPath;

  final double? rating;

  AuthorDetails({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating']?.toDouble(),
    );
  }
}
