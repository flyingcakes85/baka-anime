// Baka Anime - A Simple Demonstration App for Kitsu API (unofficial)
// Copyright (C) 2021  Snehit Sah

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:convert';
import 'package:animeapidemo/anime_classes/anime_super.dart';

AnimeData animeDataResultsFromMap(String str) =>
    AnimeData.fromMap(json.decode(str));

String animeDataResultsToMap(AnimeData data) => json.encode(data.toMap());

class AnimeData {
  AnimeData({
    this.data,
    this.meta,
    this.links,
  });

  List<Datum> data;
  AnimeDataMeta meta;
  AnimeDataLinks links;

  factory AnimeData.fromMap(Map<String, dynamic> json) => AnimeData(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        meta: json["meta"] == null ? null : AnimeDataMeta.fromMap(json["meta"]),
        links: json["links"] == null
            ? null
            : AnimeDataLinks.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta == null ? null : meta.toMap(),
        "links": links == null ? null : links.toMap(),
      };
}

// class Datum {
//   Datum({
//     this.id,
//     this.type,
//     this.links,
//     this.attributes,
//     this.relationships,
//   });

//   String id;
//   Type type;
//   DatumLinks links;
//   Attributes attributes;
//   Map<String, Relationship> relationships;

//   factory Datum.fromMap(Map<String, dynamic> json) => Datum(
//         id: json["id"] == null ? null : json["id"],
//         type: json["type"] == null ? null : typeValues.map[json["type"]],
//         links: json["links"] == null ? null : DatumLinks.fromMap(json["links"]),
//         attributes: json["attributes"] == null
//             ? null
//             : Attributes.fromMap(json["attributes"]),
//         relationships: json["relationships"] == null
//             ? null
//             : Map.from(json["relationships"]).map((k, v) =>
//                 MapEntry<String, Relationship>(k, Relationship.fromMap(v))),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "type": type == null ? null : typeValues.reverse[type],
//         "links": links == null ? null : links.toMap(),
//         "attributes": attributes == null ? null : attributes.toMap(),
//         "relationships": relationships == null
//             ? null
//             : Map.from(relationships)
//                 .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
//       };
// }

// class Attributes {
//   Attributes({
//     this.createdAt,
//     this.updatedAt,
//     this.slug,
//     this.synopsis,
//     this.description,
//     this.coverImageTopOffset,
//     this.titles,
//     this.canonicalTitle,
//     this.abbreviatedTitles,
//     this.averageRating,
//     this.ratingFrequencies,
//     this.userCount,
//     this.favoritesCount,
//     this.startDate,
//     this.endDate,
//     this.nextRelease,
//     this.popularityRank,
//     this.ratingRank,
//     this.ageRating,
//     this.ageRatingGuide,
//     this.subtype,
//     this.status,
//     this.tba,
//     this.posterImage,
//     this.coverImage,
//     this.episodeCount,
//     this.episodeLength,
//     this.totalLength,
//     this.youtubeVideoId,
//     this.showType,
//     this.nsfw,
//   });

//   DateTime createdAt;
//   DateTime updatedAt;
//   String slug;
//   String synopsis;
//   String description;
//   int coverImageTopOffset;
//   Titles titles;
//   String canonicalTitle;
//   List<String> abbreviatedTitles;
//   String averageRating;
//   Map<String, String> ratingFrequencies;
//   int userCount;
//   int favoritesCount;
//   DateTime startDate;
//   DateTime endDate;
//   dynamic nextRelease;
//   int popularityRank;
//   int ratingRank;
//   AgeRating ageRating;
//   String ageRatingGuide;
//   String subtype;
//   Status status;
//   String tba;
//   PosterImage posterImage;
//   CoverImage coverImage;
//   int episodeCount;
//   int episodeLength;
//   int totalLength;
//   String youtubeVideoId;
//   String showType;
//   bool nsfw;

//   factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         slug: json["slug"] == null ? null : json["slug"],
//         synopsis: json["synopsis"] == null ? null : json["synopsis"],
//         description: json["description"] == null ? null : json["description"],
//         coverImageTopOffset: json["coverImageTopOffset"] == null
//             ? null
//             : json["coverImageTopOffset"],
//         titles: json["titles"] == null ? null : Titles.fromMap(json["titles"]),
//         canonicalTitle:
//             json["canonicalTitle"] == null ? null : json["canonicalTitle"],
//         abbreviatedTitles: json["abbreviatedTitles"] == null
//             ? null
//             : List<String>.from(json["abbreviatedTitles"].map((x) => x)),
//         averageRating:
//             json["averageRating"] == null ? null : json["averageRating"],
//         ratingFrequencies: json["ratingFrequencies"] == null
//             ? null
//             : Map.from(json["ratingFrequencies"])
//                 .map((k, v) => MapEntry<String, String>(k, v)),
//         userCount: json["userCount"] == null ? null : json["userCount"],
//         favoritesCount:
//             json["favoritesCount"] == null ? null : json["favoritesCount"],
//         startDate: json["startDate"] == null
//             ? null
//             : DateTime.parse(json["startDate"]),
//         endDate:
//             json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
//         nextRelease: json["nextRelease"],
//         popularityRank:
//             json["popularityRank"] == null ? null : json["popularityRank"],
//         ratingRank: json["ratingRank"] == null ? null : json["ratingRank"],
//         ageRating: json["ageRating"] == null
//             ? null
//             : ageRatingValues.map[json["ageRating"]],
//         ageRatingGuide:
//             json["ageRatingGuide"] == null ? null : json["ageRatingGuide"],
//         subtype: json["subtype"] == null ? null : json["subtype"],
//         status:
//             json["status"] == null ? null : statusValues.map[json["status"]],
//         tba: json["tba"] == null ? null : json["tba"],
//         posterImage: json["posterImage"] == null
//             ? null
//             : PosterImage.fromMap(json["posterImage"]),
//         coverImage: json["coverImage"] == null
//             ? null
//             : CoverImage.fromMap(json["coverImage"]),
//         episodeCount:
//             json["episodeCount"] == null ? null : json["episodeCount"],
//         episodeLength:
//             json["episodeLength"] == null ? null : json["episodeLength"],
//         totalLength: json["totalLength"] == null ? null : json["totalLength"],
//         youtubeVideoId:
//             json["youtubeVideoId"] == null ? null : json["youtubeVideoId"],
//         showType: json["showType"] == null ? null : json["showType"],
//         nsfw: json["nsfw"] == null ? null : json["nsfw"],
//       );

//   Map<String, dynamic> toMap() => {
//         "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
//         "slug": slug == null ? null : slug,
//         "synopsis": synopsis == null ? null : synopsis,
//         "description": description == null ? null : description,
//         "coverImageTopOffset":
//             coverImageTopOffset == null ? null : coverImageTopOffset,
//         "titles": titles == null ? null : titles.toMap(),
//         "canonicalTitle": canonicalTitle == null ? null : canonicalTitle,
//         "abbreviatedTitles": abbreviatedTitles == null
//             ? null
//             : List<dynamic>.from(abbreviatedTitles.map((x) => x)),
//         "averageRating": averageRating == null ? null : averageRating,
//         "ratingFrequencies": ratingFrequencies == null
//             ? null
//             : Map.from(ratingFrequencies)
//                 .map((k, v) => MapEntry<String, dynamic>(k, v)),
//         "userCount": userCount == null ? null : userCount,
//         "favoritesCount": favoritesCount == null ? null : favoritesCount,
//         "startDate": startDate == null
//             ? null
//             : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
//         "endDate": endDate == null
//             ? null
//             : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
//         "nextRelease": nextRelease,
//         "popularityRank": popularityRank == null ? null : popularityRank,
//         "ratingRank": ratingRank == null ? null : ratingRank,
//         "ageRating":
//             ageRating == null ? null : ageRatingValues.reverse[ageRating],
//         "ageRatingGuide": ageRatingGuide == null ? null : ageRatingGuide,
//         "subtype": subtype == null ? null : subtype,
//         "status": status == null ? null : statusValues.reverse[status],
//         "tba": tba == null ? null : tba,
//         "posterImage": posterImage == null ? null : posterImage.toMap(),
//         "coverImage": coverImage == null ? null : coverImage.toMap(),
//         "episodeCount": episodeCount == null ? null : episodeCount,
//         "episodeLength": episodeLength == null ? null : episodeLength,
//         "totalLength": totalLength == null ? null : totalLength,
//         "youtubeVideoId": youtubeVideoId == null ? null : youtubeVideoId,
//         "showType": showType == null ? null : showType,
//         "nsfw": nsfw == null ? null : nsfw,
//       };
// }

enum AgeRating { R, G }

final ageRatingValues = EnumValues({"G": AgeRating.G, "R": AgeRating.R});

// class CoverImage {
//   CoverImage({
//     this.tiny,
//     this.small,
//     this.large,
//     this.original,
//     this.meta,
//   });

//   String tiny;
//   String small;
//   String large;
//   String original;
//   CoverImageMeta meta;

//   factory CoverImage.fromMap(Map<String, dynamic> json) => CoverImage(
//         tiny: json["tiny"] == null ? null : json["tiny"],
//         small: json["small"] == null ? null : json["small"],
//         large: json["large"] == null ? null : json["large"],
//         original: json["original"] == null ? null : json["original"],
//         meta:
//             json["meta"] == null ? null : CoverImageMeta.fromMap(json["meta"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "tiny": tiny == null ? null : tiny,
//         "small": small == null ? null : small,
//         "large": large == null ? null : large,
//         "original": original == null ? null : original,
//         "meta": meta == null ? null : meta.toMap(),
//       };
// }

// class CoverImageMeta {
//   CoverImageMeta({
//     this.dimensions,
//   });

//   PurpleDimensions dimensions;

//   factory CoverImageMeta.fromMap(Map<String, dynamic> json) => CoverImageMeta(
//         dimensions: json["dimensions"] == null
//             ? null
//             : PurpleDimensions.fromMap(json["dimensions"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "dimensions": dimensions == null ? null : dimensions.toMap(),
//       };
// }

// class PurpleDimensions {
//   PurpleDimensions({
//     this.tiny,
//     this.small,
//     this.large,
//   });

//   Large tiny;
//   Large small;
//   Large large;

//   factory PurpleDimensions.fromMap(Map<String, dynamic> json) =>
//       PurpleDimensions(
//         tiny: json["tiny"] == null ? null : Large.fromMap(json["tiny"]),
//         small: json["small"] == null ? null : Large.fromMap(json["small"]),
//         large: json["large"] == null ? null : Large.fromMap(json["large"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "tiny": tiny == null ? null : tiny.toMap(),
//         "small": small == null ? null : small.toMap(),
//         "large": large == null ? null : large.toMap(),
//       };
// }

// class Large {
//   Large({
//     this.width,
//     this.height,
//   });

//   int width;
//   int height;

//   factory Large.fromMap(Map<String, dynamic> json) => Large(
//         width: json["width"] == null ? null : json["width"],
//         height: json["height"] == null ? null : json["height"],
//       );

//   Map<String, dynamic> toMap() => {
//         "width": width == null ? null : width,
//         "height": height == null ? null : height,
//       };
// }

// class PosterImage {
//   PosterImage({
//     this.tiny,
//     this.small,
//     this.medium,
//     this.large,
//     this.original,
//     this.meta,
//   });

//   String tiny;
//   String small;
//   String medium;
//   String large;
//   String original;
//   PosterImageMeta meta;

//   factory PosterImage.fromMap(Map<String, dynamic> json) => PosterImage(
//         tiny: json["tiny"] == null ? null : json["tiny"],
//         small: json["small"] == null ? null : json["small"],
//         medium: json["medium"] == null ? null : json["medium"],
//         large: json["large"] == null ? null : json["large"],
//         original: json["original"] == null ? null : json["original"],
//         meta:
//             json["meta"] == null ? null : PosterImageMeta.fromMap(json["meta"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "tiny": tiny == null ? null : tiny,
//         "small": small == null ? null : small,
//         "medium": medium == null ? null : medium,
//         "large": large == null ? null : large,
//         "original": original == null ? null : original,
//         "meta": meta == null ? null : meta.toMap(),
//       };
// }

// class PosterImageMeta {
//   PosterImageMeta({
//     this.dimensions,
//   });

//   FluffyDimensions dimensions;

//   factory PosterImageMeta.fromMap(Map<String, dynamic> json) => PosterImageMeta(
//         dimensions: json["dimensions"] == null
//             ? null
//             : FluffyDimensions.fromMap(json["dimensions"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "dimensions": dimensions == null ? null : dimensions.toMap(),
//       };
// }

// class FluffyDimensions {
//   FluffyDimensions({
//     this.tiny,
//     this.small,
//     this.medium,
//     this.large,
//   });

//   Large tiny;
//   Large small;
//   Large medium;
//   Large large;

//   factory FluffyDimensions.fromMap(Map<String, dynamic> json) =>
//       FluffyDimensions(
//         tiny: json["tiny"] == null ? null : Large.fromMap(json["tiny"]),
//         small: json["small"] == null ? null : Large.fromMap(json["small"]),
//         medium: json["medium"] == null ? null : Large.fromMap(json["medium"]),
//         large: json["large"] == null ? null : Large.fromMap(json["large"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "tiny": tiny == null ? null : tiny.toMap(),
//         "small": small == null ? null : small.toMap(),
//         "medium": medium == null ? null : medium.toMap(),
//         "large": large == null ? null : large.toMap(),
//       };
// }

enum Status { FINISHED }

final statusValues = EnumValues({"finished": Status.FINISHED});

// class Titles {
//   Titles({
//     this.en,
//     this.enJp,
//     this.jaJp,
//     this.enUs,
//     this.koKr,
//   });

//   String en;
//   String enJp;
//   String jaJp;
//   String enUs;
//   String koKr;

//   factory Titles.fromMap(Map<String, dynamic> json) => Titles(
//         en: json["en"] == null ? null : json["en"],
//         enJp: json["en_jp"] == null ? null : json["en_jp"],
//         jaJp: json["ja_jp"] == null ? null : json["ja_jp"],
//         enUs: json["en_us"] == null ? null : json["en_us"],
//         koKr: json["ko_kr"] == null ? null : json["ko_kr"],
//       );

//   Map<String, dynamic> toMap() => {
//         "en": en == null ? null : en,
//         "en_jp": enJp == null ? null : enJp,
//         "ja_jp": jaJp == null ? null : jaJp,
//         "en_us": enUs == null ? null : enUs,
//         "ko_kr": koKr == null ? null : koKr,
//       };
// }

// class DatumLinks {
//   DatumLinks({
//     this.self,
//   });

//   String self;

//   factory DatumLinks.fromMap(Map<String, dynamic> json) => DatumLinks(
//         self: json["self"] == null ? null : json["self"],
//       );

//   Map<String, dynamic> toMap() => {
//         "self": self == null ? null : self,
//       };
// }

// class Relationship {
//   Relationship({
//     this.links,
//   });

//   RelationshipLinks links;

//   factory Relationship.fromMap(Map<String, dynamic> json) => Relationship(
//         links: json["links"] == null
//             ? null
//             : RelationshipLinks.fromMap(json["links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "links": links == null ? null : links.toMap(),
//       };
// }

// class RelationshipLinks {
//   RelationshipLinks({
//     this.self,
//     this.related,
//   });

//   String self;
//   String related;

//   factory RelationshipLinks.fromMap(Map<String, dynamic> json) =>
//       RelationshipLinks(
//         self: json["self"] == null ? null : json["self"],
//         related: json["related"] == null ? null : json["related"],
//       );

//   Map<String, dynamic> toMap() => {
//         "self": self == null ? null : self,
//         "related": related == null ? null : related,
//       };
// }

enum Type { ANIME }

final typeValues = EnumValues({"anime": Type.ANIME});

class AnimeDataLinks {
  AnimeDataLinks({
    this.first,
    this.next,
    this.last,
  });

  String first;
  String next;
  String last;

  factory AnimeDataLinks.fromMap(Map<String, dynamic> json) => AnimeDataLinks(
        first: json["first"] == null ? null : json["first"],
        next: json["next"] == null ? null : json["next"],
        last: json["last"] == null ? null : json["last"],
      );

  Map<String, dynamic> toMap() => {
        "first": first == null ? null : first,
        "next": next == null ? null : next,
        "last": last == null ? null : last,
      };
}

class AnimeDataMeta {
  AnimeDataMeta({
    this.count,
  });

  int count;

  factory AnimeDataMeta.fromMap(Map<String, dynamic> json) => AnimeDataMeta(
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toMap() => {
        "count": count == null ? null : count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
