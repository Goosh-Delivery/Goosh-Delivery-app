class Food {
  final int foodId;
  final String foodName;
  final String description;
  final double price;
  final double rating;
  final String delivaryTime;
  final String pictureUrl;

  Food(this.foodId, this.foodName, this.description, this.price, this.rating,
      this.delivaryTime, this.pictureUrl);

  static String trimText(String text, int limit) {
    return text.substring(0, limit) + "...";
  }
}
