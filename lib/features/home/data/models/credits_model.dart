class Credits {
  final List<Cast> cast;
  final List<Crew> crew;
  final List<GuestStars> guestStarts;

  final int id;

  Credits({
    required this.cast,
    required this.crew,
    required this.guestStarts,
    required this.id,
  });
  factory Credits.fromJson(json) {
    return Credits(
      cast: (json['cast'] as List).map((e) => Cast.fromJson(e)).toList(),
      crew: (json['crews'] as List).map((e) => Crew.fromJson(e)).toList(),
      guestStarts: (json['guest_stars'] as List)
          .map((e) => GuestStars.fromJson(e))
          .toList(),
      id: json['id'],
    );
  }
}

class Cast {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String? character;
  final String? creditId;
  final int? order;

  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.character,
    this.creditId,
    this.order,
  });
  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      order: json['order'] as int?,
    );
  }
}

class Crew {
  final String department;
  final String job;
  final String creditId;
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  Crew({
    required this.department,
    required this.job,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      department: json['department'] as String,
      job: json['job'] as String,
      creditId: json['credit_id'] as String,
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );
  }
}

class GuestStars {
  final String character;
  final String creditId;
  final int order;
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  GuestStars({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });

  factory GuestStars.fromJson(Map<String, dynamic> json) {
    return GuestStars(
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: json['order'] as int,
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );
  }
}
