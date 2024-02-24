import 'dart:convert';

class Restaurant {
  final String? address;
  final String? restaurantName;
  final String? description;
  final String? price;
  final String? urlToImage;
  final String? rating;
  final String? review;

  Restaurant({
    required this.address,
    required this.restaurantName,
    required this.description,
    required this.price,
    required this.urlToImage,
    required this.rating,
    required this.review,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
        address: restaurant['address'],
        restaurantName: restaurant['restaurantName'],
        description: restaurant['description'],
        price: restaurant['price'],
        urlToImage: restaurant['urlToImage'],
        rating: restaurant['rating'],
        review: restaurant['review'],
      );
}

List<Restaurant> parseArticle(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  print('Hasil Parsed : $parsed');
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
