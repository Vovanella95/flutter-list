class MovieModel {
  String imageUrl;
  String title;
  int year;
  String titleType;
  String id;

  MovieModel(this.imageUrl, this.title, this.year, this.titleType, this.id);

  Map<String, dynamic> toMap() => {
        "imageUrl": imageUrl,
        "title": title,
        "year": year,
        "titleType": titleType,
        "id": id
      };

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
      json["imageUrl"],
      json["title"],
      json["year"],
      json["titleType"],
      json["id"]);
}
