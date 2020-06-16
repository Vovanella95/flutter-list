class ExpandedMovieData {
  String description;
  String author;

  ExpandedMovieData.fromJson(Map<String, dynamic> item) {
    final plotSummary = item["plotOutline"];

    author = plotSummary["author"];
    description = plotSummary["text"];
  }
}
