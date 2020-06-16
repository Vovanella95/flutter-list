class SearchResultData {
  String imageUrl;
  String title;
  int year;
  String titleType;
  String id;

  SearchResultData.fromJson(Map<String, dynamic> item) {
    title = item["title"];
    year = item["year"];
    titleType = item["titleType"];
    id = item["id"];

    var imageRoot = item["image"];

    if (imageRoot != null) {
      imageUrl = imageRoot["url"];
    } else {
      imageUrl = "";
    }
  }
}
