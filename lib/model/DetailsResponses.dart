/// adult : false
/// backdrop_path : "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg"
/// belongs_to_collection : null
/// budget : 63000000
/// genres : [{"id":18,"name":"Drama"},{"id":53,"name":"Thriller"},{"id":35,"name":"Comedy"}]
/// homepage : "http://www.foxmovies.com/movies/fight-club"
/// id : 550
/// imdb_id : "tt0137523"
/// original_language : "en"
/// original_title : "Fight Club"
/// overview : "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."
/// popularity : 61.416
/// poster_path : "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg"
/// production_companies : [{"id":508,"logo_path":"/7cxRWzi4LsVm4Utfpr1hfARNurT.png","name":"Regency Enterprises","origin_country":"US"},{"id":711,"logo_path":"/tEiIH5QesdheJmDAqQwvtN60727.png","name":"Fox 2000 Pictures","origin_country":"US"},{"id":20555,"logo_path":"/hD8yEGUBlHOcfHYbujp71vD8gZp.png","name":"Taurus Film","origin_country":"DE"},{"id":54051,"logo_path":null,"name":"Atman Entertainment","origin_country":""},{"id":54052,"logo_path":null,"name":"Knickerbocker Films","origin_country":"US"},{"id":4700,"logo_path":"/A32wmjrs9Psf4zw0uaixF0GXfxq.png","name":"The Linson Company","origin_country":"US"},{"id":25,"logo_path":"/qZCc1lty5FzX30aOCVRBLzaVmcp.png","name":"20th Century Fox","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1999-10-15"
/// revenue : 100853753
/// runtime : 139
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Mischief. Mayhem. Soap."
/// title : "Fight Club"
/// video : false
/// vote_average : 8.433
/// vote_count : 26280

class DetailsResponses {
  DetailsResponses({
    this.status_message,
    this.status_code,
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,});

  DetailsResponses.fromJson(dynamic json) {
    status_code =json['status_code'];
    status_message = json['status_message'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  int?status_code;
  String?status_message;
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }

}

/// iso_3166_1 : "US"
/// name : "United States of America"

class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,});

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }

}

/// id : 508
/// logo_path : "/7cxRWzi4LsVm4Utfpr1hfARNurT.png"
/// name : "Regency Enterprises"
/// origin_country : "US"

class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,});

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

}

/// id : 18
/// name : "Drama"

class Genres {
  Genres({
    this.status_message,
    this.status_code,
    this.id,
    this.name,});

  Genres.fromJson(dynamic json) {
    status_code =json['status_code'];
    status_message = json['status_message'];
    id = json['id'];
    name = json['name'];

  }
  int? id;
  String? name;
  int?status_code;
  String?status_message;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['name'] = name;
    return map;
  }

}