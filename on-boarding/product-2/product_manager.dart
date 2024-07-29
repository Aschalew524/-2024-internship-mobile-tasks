import 'product.dart';

class ProductManager {
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    print('Product added successfully.');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products available.');
      return;
    }
    for (var product in _products) {
      print(product);
    }
  }

  void viewProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print('Product not found.');
      return;
    }
    print(_products[index]);
  }

  void editProduct(int index, String name, String description, double price) {
    if (index < 0 || index >= _products.length) {
      print('Product not found.');
      return;
    }
    var product = _products[index];
    product.name = name;
    product.description = description;
    product.price = price;
    print('Product updated successfully.');
  }

  void deleteProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print('Product not found.');
      return;
    }
    _products.removeAt(index);
    print('Product deleted successfully.');
  }
}
