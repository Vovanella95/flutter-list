class MovieVideoData {
  String contentType;
  String description;
  int durationInSeconds;
  String imageUrl;
  String title;

  MovieVideoData.fromJson(Map<String, dynamic> item) {
    contentType = item["contentType"];
    description = item["description"];
    durationInSeconds = item["durationInSeconds"];
    
    var image = item["image"];
    imageUrl = image["url"];

    title = item["title"];
  }
}
