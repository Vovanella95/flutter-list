class SearchResult {
  String imageUrl;
  String title;
  int year;
  String titleType;

  SearchResult.fromJson(Map<String, dynamic> item) {
    title = item["title"];
    year = item["year"];
    titleType = item["titleType"];

    var imageRoot = item["image"];

    if (imageRoot != null) {
      imageUrl = imageRoot["url"];
    }else{
      imageUrl = "";
    }
  }
}
