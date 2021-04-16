import 'dart:convert';

Anime animeFromMap(String str) => Anime.fromMap(json.decode(str));

String animeToMap(Anime data) => json.encode(data.toMap());

class Anime {
  Anime({
    this.data,
  });

  List<Datum> data;

  factory Anime.fromMap(Map<String, dynamic> json) => Anime(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.id,
    this.type,
    this.links,
    this.attributes,
    this.relationships,
  });

  String id;
  String type;
  DatumLinks links;
  Attributes attributes;
  Map<String, Relationship> relationships;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        links: json["links"] == null ? null : DatumLinks.fromMap(json["links"]),
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromMap(json["attributes"]),
        relationships: json["relationships"] == null
            ? null
            : Map.from(json["relationships"]).map((k, v) =>
                MapEntry<String, Relationship>(k, Relationship.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "links": links == null ? null : links.toMap(),
        "attributes": attributes == null ? null : attributes.toMap(),
        "relationships": relationships == null
            ? null
            : Map.from(relationships)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class Attributes {
  Attributes({
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.synopsis,
    this.coverImageTopOffset,
    this.titles,
    this.canonicalTitle,
    this.abbreviatedTitles,
    this.averageRating,
    this.ratingFrequencies,
    this.userCount,
    this.favoritesCount,
    this.startDate,
    this.endDate,
    this.popularityRank,
    this.ratingRank,
    this.ageRating,
    this.ageRatingGuide,
    this.subtype,
    this.status,
    this.tba,
    this.posterImage,
    this.coverImage,
    this.episodeCount,
    this.episodeLength,
    this.youtubeVideoId,
    this.showType,
    this.nsfw,
  });

  DateTime createdAt;
  DateTime updatedAt;
  String slug;
  String synopsis;
  int coverImageTopOffset;
  Titles titles;
  String canonicalTitle;
  List<String> abbreviatedTitles;
  String averageRating;
  Map<String, String> ratingFrequencies;
  int userCount;
  int favoritesCount;
  DateTime startDate;
  DateTime endDate;
  int popularityRank;
  int ratingRank;
  String ageRating;
  String ageRatingGuide;
  String subtype;
  String status;
  String tba;
  PosterImage posterImage;
  CoverImage coverImage;
  int episodeCount;
  int episodeLength;
  String youtubeVideoId;
  String showType;
  bool nsfw;

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        slug: json["slug"] == null ? null : json["slug"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        coverImageTopOffset: json["coverImageTopOffset"] == null
            ? null
            : json["coverImageTopOffset"],
        titles: json["titles"] == null ? null : Titles.fromMap(json["titles"]),
        canonicalTitle:
            json["canonicalTitle"] == null ? null : json["canonicalTitle"],
        abbreviatedTitles: json["abbreviatedTitles"] == null
            ? null
            : List<String>.from(json["abbreviatedTitles"].map((x) => x)),
        averageRating:
            json["averageRating"] == null ? null : json["averageRating"],
        ratingFrequencies: json["ratingFrequencies"] == null
            ? null
            : Map.from(json["ratingFrequencies"])
                .map((k, v) => MapEntry<String, String>(k, v)),
        userCount: json["userCount"] == null ? null : json["userCount"],
        favoritesCount:
            json["favoritesCount"] == null ? null : json["favoritesCount"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        popularityRank:
            json["popularityRank"] == null ? null : json["popularityRank"],
        ratingRank: json["ratingRank"] == null ? null : json["ratingRank"],
        ageRating: json["ageRating"] == null ? null : json["ageRating"],
        ageRatingGuide:
            json["ageRatingGuide"] == null ? null : json["ageRatingGuide"],
        subtype: json["subtype"] == null ? null : json["subtype"],
        status: json["status"] == null ? null : json["status"],
        tba: json["tba"] == null ? null : json["tba"],
        posterImage: json["posterImage"] == null
            ? null
            : PosterImage.fromMap(json["posterImage"]),
        coverImage: json["coverImage"] == null
            ? null
            : CoverImage.fromMap(json["coverImage"]),
        episodeCount:
            json["episodeCount"] == null ? null : json["episodeCount"],
        episodeLength:
            json["episodeLength"] == null ? null : json["episodeLength"],
        youtubeVideoId:
            json["youtubeVideoId"] == null ? null : json["youtubeVideoId"],
        showType: json["showType"] == null ? null : json["showType"],
        nsfw: json["nsfw"] == null ? null : json["nsfw"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "slug": slug == null ? null : slug,
        "synopsis": synopsis == null ? null : synopsis,
        "coverImageTopOffset":
            coverImageTopOffset == null ? null : coverImageTopOffset,
        "titles": titles == null ? null : titles.toMap(),
        "canonicalTitle": canonicalTitle == null ? null : canonicalTitle,
        "abbreviatedTitles": abbreviatedTitles == null
            ? null
            : List<dynamic>.from(abbreviatedTitles.map((x) => x)),
        "averageRating": averageRating == null ? null : averageRating,
        "ratingFrequencies": ratingFrequencies == null
            ? null
            : Map.from(ratingFrequencies)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "userCount": userCount == null ? null : userCount,
        "favoritesCount": favoritesCount == null ? null : favoritesCount,
        "startDate": startDate == null
            ? null
            : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": endDate == null
            ? null
            : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "popularityRank": popularityRank == null ? null : popularityRank,
        "ratingRank": ratingRank == null ? null : ratingRank,
        "ageRating": ageRating == null ? null : ageRating,
        "ageRatingGuide": ageRatingGuide == null ? null : ageRatingGuide,
        "subtype": subtype == null ? null : subtype,
        "status": status == null ? null : status,
        "tba": tba == null ? null : tba,
        "posterImage": posterImage == null ? null : posterImage.toMap(),
        "coverImage": coverImage == null ? null : coverImage.toMap(),
        "episodeCount": episodeCount == null ? null : episodeCount,
        "episodeLength": episodeLength == null ? null : episodeLength,
        "youtubeVideoId": youtubeVideoId == null ? null : youtubeVideoId,
        "showType": showType == null ? null : showType,
        "nsfw": nsfw == null ? null : nsfw,
      };
}

class CoverImage {
  CoverImage({
    this.tiny,
    this.small,
    this.large,
    this.original,
    this.meta,
  });

  String tiny;
  String small;
  String large;
  String original;
  Meta meta;

  factory CoverImage.fromMap(Map<String, dynamic> json) => CoverImage(
        tiny: json["tiny"] == null ? null : json["tiny"],
        small: json["small"] == null ? null : json["small"],
        large: json["large"] == null ? null : json["large"],
        original: json["original"] == null ? null : json["original"],
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "tiny": tiny == null ? null : tiny,
        "small": small == null ? null : small,
        "large": large == null ? null : large,
        "original": original == null ? null : original,
        "meta": meta == null ? null : meta.toMap(),
      };
}

class Meta {
  Meta({
    this.dimensions,
  });

  Dimensions dimensions;

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromMap(json["dimensions"]),
      );

  Map<String, dynamic> toMap() => {
        "dimensions": dimensions == null ? null : dimensions.toMap(),
      };
}

class Dimensions {
  Dimensions({
    this.tiny,
    this.small,
    this.large,
    this.medium,
  });

  Large tiny;
  Large small;
  Large large;
  Large medium;

  factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
        tiny: json["tiny"] == null ? null : Large.fromMap(json["tiny"]),
        small: json["small"] == null ? null : Large.fromMap(json["small"]),
        large: json["large"] == null ? null : Large.fromMap(json["large"]),
        medium: json["medium"] == null ? null : Large.fromMap(json["medium"]),
      );

  Map<String, dynamic> toMap() => {
        "tiny": tiny == null ? null : tiny.toMap(),
        "small": small == null ? null : small.toMap(),
        "large": large == null ? null : large.toMap(),
        "medium": medium == null ? null : medium.toMap(),
      };
}

class Large {
  Large({
    this.width,
    this.height,
  });

  dynamic width;
  dynamic height;

  factory Large.fromMap(Map<String, dynamic> json) => Large(
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
      };
}

class PosterImage {
  PosterImage({
    this.tiny,
    this.small,
    this.medium,
    this.large,
    this.original,
    this.meta,
  });

  String tiny;
  String small;
  String medium;
  String large;
  String original;
  Meta meta;

  factory PosterImage.fromMap(Map<String, dynamic> json) => PosterImage(
        tiny: json["tiny"] == null ? null : json["tiny"],
        small: json["small"] == null ? null : json["small"],
        medium: json["medium"] == null ? null : json["medium"],
        large: json["large"] == null ? null : json["large"],
        original: json["original"] == null ? null : json["original"],
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "tiny": tiny == null ? null : tiny,
        "small": small == null ? null : small,
        "medium": medium == null ? null : medium,
        "large": large == null ? null : large,
        "original": original == null ? null : original,
        "meta": meta == null ? null : meta.toMap(),
      };
}

class Titles {
  Titles({
    this.en,
    this.enJp,
    this.jaJp,
  });

  String en;
  String enJp;
  String jaJp;

  factory Titles.fromMap(Map<String, dynamic> json) => Titles(
        en: json["en"] == null ? null : json["en"],
        enJp: json["en_jp"] == null ? null : json["en_jp"],
        jaJp: json["ja_jp"] == null ? null : json["ja_jp"],
      );

  Map<String, dynamic> toMap() => {
        "en": en == null ? null : en,
        "en_jp": enJp == null ? null : enJp,
        "ja_jp": jaJp == null ? null : jaJp,
      };
}

class DatumLinks {
  DatumLinks({
    this.self,
  });

  String self;

  factory DatumLinks.fromMap(Map<String, dynamic> json) => DatumLinks(
        self: json["self"] == null ? null : json["self"],
      );

  Map<String, dynamic> toMap() => {
        "self": self == null ? null : self,
      };
}

class Relationship {
  Relationship({
    this.links,
  });

  RelationshipLinks links;

  factory Relationship.fromMap(Map<String, dynamic> json) => Relationship(
        links: json["links"] == null
            ? null
            : RelationshipLinks.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "links": links == null ? null : links.toMap(),
      };
}

class RelationshipLinks {
  RelationshipLinks({
    this.self,
    this.related,
  });

  String self;
  String related;

  factory RelationshipLinks.fromMap(Map<String, dynamic> json) =>
      RelationshipLinks(
        self: json["self"] == null ? null : json["self"],
        related: json["related"] == null ? null : json["related"],
      );

  Map<String, dynamic> toMap() => {
        "self": self == null ? null : self,
        "related": related == null ? null : related,
      };
}
