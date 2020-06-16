class MovieVideoModel {
  final String contentType;
  final String description;
  final int durationInSeconds;
  final String imageUrl;
  final String title;

  const MovieVideoModel(this.title, this.description, this.contentType,
      this.durationInSeconds, this.imageUrl);
}
