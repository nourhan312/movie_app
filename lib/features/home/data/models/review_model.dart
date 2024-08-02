class Review {
  final List<ReviewResult> results;

  Review({required this.results});

  factory Review.FromJson(json) {
    return Review(
        results: (json['results'] as List)
            .map((e) => ReviewResult.FromJson(e))
            .toList());
  }
}

class ReviewResult {
  final String author;
  final double rating;
  final String content;

  ReviewResult({
    required this.author,
    required this.rating,
    required this.content,
  });

  factory ReviewResult.FromJson(json) {
    return ReviewResult(
        author: json['author'],
        rating: json['rating'],
        content: json['content']);
  }
}
