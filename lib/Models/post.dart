import 'dart:convert';
import 'package:http/http.dart' as http;

List<Post> postFromJson(String str) {
  final Map<String, dynamic> json = jsonDecode(str);
  
  if (json['meals'] == null) {
    return [];
  }
  
  final List<dynamic> meals = json['meals'];
  return meals.map((meal) => Post.fromMap(meal)).toList();
}

class Post {
  Post({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strMealThumb,
    required this.isFavorite,
  });

  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strMealThumb;
  bool isFavorite;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strCategory: json["strCategory"],
        strArea: json["strArea"],
        strMealThumb: json["strMealThumb"],
        isFavorite: false,
      );
  void toggleFavorite(Post post) {
    post.isFavorite = !post.isFavorite;
  }
}

Future<List<Post>> fetchPost(String query) async {
  final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query'));

  if (response.statusCode == 200) {
    return postFromJson(response.body);
  } else {
    throw Exception('Failed to load meals');
  }
}