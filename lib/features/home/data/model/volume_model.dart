
import 'book_model.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({this.title, this.authors, this.publisher, this.publishedDate, this.description, this.industryIdentifiers, this.readingModes, this.pageCount, this.printType, this.categories, this.maturityRating, this.allowAnonLogging, this.contentVersion, this.panelizationSummary, this.imageLinks, this.language, this.previewLink, this.infoLink, this.canonicalVolumeLink});

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["authors"] is List) {
      authors = json["authors"] == null ? null : List<String>.from(json["authors"]);
    }
    if(json["publisher"] is String) {
      publisher = json["publisher"];
    }
    if(json["publishedDate"] is String) {
      publishedDate = json["publishedDate"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["industryIdentifiers"] is List) {
      industryIdentifiers = json["industryIdentifiers"] == null ? null : (json["industryIdentifiers"] as List).map((e) => IndustryIdentifiers.fromJson(e)).toList();
    }
    if(json["readingModes"] is Map) {
      readingModes = json["readingModes"] == null ? null : ReadingModes.fromJson(json["readingModes"]);
    }
    if(json["pageCount"] is int) {
      pageCount = json["pageCount"];
    }
    if(json["printType"] is String) {
      printType = json["printType"];
    }
    if(json["categories"] is List) {
      categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    }
    if(json["maturityRating"] is String) {
      maturityRating = json["maturityRating"];
    }
    if(json["allowAnonLogging"] is bool) {
      allowAnonLogging = json["allowAnonLogging"];
    }
    if(json["contentVersion"] is String) {
      contentVersion = json["contentVersion"];
    }
    if(json["panelizationSummary"] is Map) {
      panelizationSummary = json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]);
    }
    if(json["imageLinks"] is Map) {
      imageLinks = json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]);
    }
    if(json["language"] is String) {
      language = json["language"];
    }
    if(json["previewLink"] is String) {
      previewLink = json["previewLink"];
    }
    if(json["infoLink"] is String) {
      infoLink = json["infoLink"];
    }
    if(json["canonicalVolumeLink"] is String) {
      canonicalVolumeLink = json["canonicalVolumeLink"];
    }
  }

  static List<VolumeInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(VolumeInfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    if(authors != null) {
      _data["authors"] = authors;
    }
    _data["publisher"] = publisher;
    _data["publishedDate"] = publishedDate;
    _data["description"] = description;
    if(industryIdentifiers != null) {
      _data["industryIdentifiers"] = industryIdentifiers?.map((e) => e.toJson()).toList();
    }
    if(readingModes != null) {
      _data["readingModes"] = readingModes?.toJson();
    }
    _data["pageCount"] = pageCount;
    _data["printType"] = printType;
    if(categories != null) {
      _data["categories"] = categories;
    }
    _data["maturityRating"] = maturityRating;
    _data["allowAnonLogging"] = allowAnonLogging;
    _data["contentVersion"] = contentVersion;
    if(panelizationSummary != null) {
      _data["panelizationSummary"] = panelizationSummary?.toJson();
    }
    if(imageLinks != null) {
      _data["imageLinks"] = imageLinks?.toJson();
    }
    _data["language"] = language;
    _data["previewLink"] = previewLink;
    _data["infoLink"] = infoLink;
    _data["canonicalVolumeLink"] = canonicalVolumeLink;
    return _data;
  }
}
