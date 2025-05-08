import 'package:cloud_firestore/cloud_firestore.dart';

class DummyData {
  static List<Map<String, dynamic>> categories = [
    {
      'name': 'All',
      'image': 'assets/images/all.png',
    },
    {
      'name': 'Breakfast',
      'image': 'assets/images/breakfast.png',
    },
    {
      'name': 'Lunch',
      'image': 'assets/images/lunch.png',
    },
    {
      'name': 'Dinner',
      'image': 'assets/images/dinner.png',
    },
    {
      'name': 'Dessert',
      'image': 'assets/images/dessert.png',
    },
  ];

  static List<Map<String, dynamic>> recipes = [
    {
      'name': 'Classic Pancakes',
      'category': 'Breakfast',
      'image': 'assets/images/pancakes.jpg',
      'time': '20',
      'cal': '320',
      'difficulty': 'Easy',
      'rate': '4.5',
      'reviews': '128',
      'ingredientsName': [
        'All-purpose flour',
        'Baking powder',
        'Salt',
        'Sugar',
        'Milk',
        'Egg',
        'Butter'
      ],
      'ingredientsAmount': ['150', '10', '5', '15', '300', '1', '45'],
      'ingredientsImage': [
        'https://images.unsplash.com/photo-1608198093002-ad4e505484ba?w=500',
        'https://images.unsplash.com/photo-1626094309830-abbb0c99da4a?w=500',
        'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=500',
        'https://images.unsplash.com/photo-1581441363689-1f3c3c414635?w=500',
        'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500',
        'https://images.unsplash.com/photo-1598965675045-45c5e72c7d65?w=500',
        'https://images.unsplash.com/photo-1621886292650-5203a4c72c9b?w=500'
      ],
      'instructions': 'Mix dry ingredients, add wet ingredients, cook on griddle until golden brown.',
    },
    {
      'name': 'Grilled Chicken Salad',
      'category': 'Lunch',
      'image': 'assets/images/chicken_salad.jpg',
      'time': '25',
      'cal': '280',
      'difficulty': 'Medium',
      'rate': '4.3',
      'reviews': '95',
      'ingredientsName': [
        'Chicken breasts',
        'Mixed salad greens',
        'Cherry tomatoes',
        'Cucumber',
        'Olive oil',
        'Balsamic vinegar'
      ],
      'ingredientsAmount': ['200', '100', '50', '100', '30', '15'],
      'ingredientsImage': [
        'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=500',
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500',
        'https://images.unsplash.com/photo-1550828520-4cb496926fc9?w=500',
        'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?w=500',
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=500',
        'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=500'
      ],
      'instructions': 'Grill chicken, chop vegetables, combine and dress with oil and vinegar.',
    },
    {
      'name': 'Chocolate Cake',
      'category': 'Dessert',
      'image': 'assets/images/chocolate_cake.jpg',
      'time': '45',
      'cal': '450',
      'difficulty': 'Medium',
      'rate': '4.8',
      'reviews': '215',
      'ingredientsName': [
        'Flour',
        'Sugar',
        'Cocoa powder',
        'Baking powder',
        'Baking soda',
        'Salt',
        'Eggs',
        'Milk',
        'Vegetable oil',
        'Vanilla extract'
      ],
      'ingredientsAmount': ['250', '200', '75', '10', '7', '5', '2', '240', '120', '10'],
      'ingredientsImage': [
        'https://images.unsplash.com/photo-1608198093002-ad4e505484ba?w=500',
        'https://images.unsplash.com/photo-1581441363689-1f3c3c414635?w=500',
        'https://images.unsplash.com/photo-1621886292650-5203a4c72c9b?w=500',
        'https://images.unsplash.com/photo-1626094309830-abbb0c99da4a?w=500',
        'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=500',
        'https://images.unsplash.com/photo-1598965675045-45c5e72c7d65?w=500',
        'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500',
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=500',
        'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=500',
        'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?w=500'
      ],
      'instructions': 'Mix dry ingredients, add wet ingredients, bake at 350°F for 30-35 minutes.',
    },
    {
      'name': 'Pasta Carbonara',
      'category': 'Dinner',
      'image': 'assets/images/carbonara.jpg',
      'time': '30',
      'cal': '650',
      'difficulty': 'Medium',
      'rate': '4.6',
      'reviews': '178',
      'ingredientsName': [
        'Spaghetti',
        'Pancetta',
        'Egg yolks',
        'Parmesan cheese',
        'Black pepper',
        'Salt'
      ],
      'ingredientsAmount': ['400', '200', '4', '50', '5', '5'],
      'ingredientsImage': [
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=500',
        'https://images.unsplash.com/photo-1608198093002-ad4e505484ba?w=500',
        'https://images.unsplash.com/photo-1598965675045-45c5e72c7d65?w=500',
        'https://images.unsplash.com/photo-1621886292650-5203a4c72c9b?w=500',
        'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?w=500',
        'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=500'
      ],
      'instructions': 'Cook pasta, fry pancetta, mix with egg and cheese sauce.',
    },
  ];

  // Helper method to convert dummy data to Firestore documents
  static Future<void> populateFirestore() async {
    final firestore = FirebaseFirestore.instance;

    // Add categories
    for (var category in categories) {
      await firestore.collection('categories').add(category);
    }

    // Add recipes
    for (var recipe in recipes) {
      await firestore.collection('recipes').add(recipe);
    }
  }
} 