class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final int cookingTime;
  final int cal;
  final double rating;
  final int reviewCount;
  final List<String> ingredients;
  final List<String> ingredientsName;
  final List<String> ingredientsImage;
  final List<double> ingredientsAmount;
  final List<String> instructions;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cookingTime,
    required this.cal,
    required this.rating,
    required this.reviewCount,
    required this.ingredients,
    required this.ingredientsName,
    required this.ingredientsImage,
    required this.ingredientsAmount,
    required this.instructions,
  });

  factory Recipe.fromFirestore(Map<String, dynamic> data, String docId) {
    return Recipe(
      id: docId,
      title: data['name'] ?? '',
      imageUrl: data['image'] ?? '',
      cookingTime: data['time'] ?? 0,
      cal: data['cal'] ?? 0,
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviewCount: data['reviewCount'] ?? 0,
      ingredients: List<String>.from(data['ingredients'] ?? []),
      ingredientsName: List<String>.from(data['ingredientsName'] ?? []),
      ingredientsImage: List<String>.from(data['ingredientsImage'] ?? []),
      ingredientsAmount: List<double>.from(
        (data['ingredientsAmount'] ?? []).map((x) => double.parse(x.toString())),
      ),
      instructions: List<String>.from(data['instructions'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': title,
      'image': imageUrl,
      'time': cookingTime,
      'cal': cal,
      'rating': rating,
      'reviewCount': reviewCount,
      'ingredients': ingredients,
      'ingredientsName': ingredientsName,
      'ingredientsImage': ingredientsImage,
      'ingredientsAmount': ingredientsAmount,
      'instructions': instructions,
    };
  }
} 