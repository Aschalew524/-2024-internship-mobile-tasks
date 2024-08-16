class Urls {
  static const String baseUrl =  'https://cors-anywhere.herokuapp.com/https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  
  static String getProduct(String id) => '$baseUrl/$id';

 
  static String deleteProduct(String id) => '$baseUrl$id';

  static String insertProduct() => baseUrl;

 
  static String updateProduct(String id) => '$baseUrl/$id';

  static String getAllProducts() => baseUrl;
}
