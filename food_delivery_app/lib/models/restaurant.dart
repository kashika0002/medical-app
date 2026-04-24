class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String deliveryTime;
  final String cuisine;
  final String city;

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
    required this.cuisine,
    required this.city,
  });

  factory Restaurant.fromFirestore(Map<String, dynamic> data, String id) {
    return Restaurant(
      id: id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      rating: (data['rating'] ?? 0.0).toDouble(),
      deliveryTime: data['deliveryTime'] ?? '',
      cuisine: data['cuisine'] ?? '',
      city: data['city'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'deliveryTime': deliveryTime,
      'cuisine': cuisine,
      'city': city,
    };
  }
}
