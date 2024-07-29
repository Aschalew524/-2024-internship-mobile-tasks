import 'dart:io';
import 'product.dart';
import 'product_manager.dart';

void main() {
  var manager = ProductManager();

  while (true) {
    print('Choose an action:');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Single Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Add a new product
        print('Enter product name:');
        String? name = stdin.readLineSync();
        if (name == null || name.trim().isEmpty) {
          print('Product name cannot be empty.');
          break;
        }

        print('Enter product description:');
        String? description = stdin.readLineSync();
        if (description == null || description.trim().isEmpty) {
          print('Product description cannot be empty.');
          break;
        }

        print('Enter product price:');
        double? price = double.tryParse(stdin.readLineSync() ?? '');
        if (price == null || price <= 0) {
          print('Invalid price. Please enter a positive number.');
          break;
        }

        var product = Product(name.trim(), description.trim(), price);
        manager.addProduct(product);
        break;

      case '2':
        // View all products
        print('All Products:');
        manager.viewAllProducts();
        break;

      case '3':
        // View a single product
        print('Enter the index of the product to view:');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index == null || index < 0) {
          print('Invalid index. Please enter a non-negative number.');
          break;
        }
        manager.viewProduct(index);
        break;

      case '4':
        // Edit a product
        print('Enter the index of the product to edit:');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index == null || index < 0) {
          print('Invalid index. Please enter a non-negative number.');
          break;
        }

        print('Enter new product name:');
        String? name = stdin.readLineSync();
        if (name == null || name.trim().isEmpty) {
          print('Product name cannot be empty.');
          break;
        }

        print('Enter new product description:');
        String? description = stdin.readLineSync();
        if (description == null || description.trim().isEmpty) {
          print('Product description cannot be empty.');
          break;
        }

        print('Enter new product price:');
        double? price = double.tryParse(stdin.readLineSync() ?? '');
        if (price == null || price <= 0) {
          print('Invalid price. Please enter a positive number.');
          break;
        }

        manager.editProduct(index, name.trim(), description.trim(), price);
        break;

      case '5':
        // Delete a product
        print('Enter the index of the product to delete:');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index == null || index < 0) {
          print('Invalid index. Please enter a non-negative number.');
          break;
        }
        manager.deleteProduct(index);
        break;

      case '6':
        // Exit the application5
        print('Exiting...');
        return;

      default:
        print('Invalid choice. Please enter a valid option.');
        break;
    }
  }
}
