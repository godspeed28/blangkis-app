// product_repository.dart
import '../models/product.dart';
import '../helpers/database_helper.dart';

class ProductRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Product>> getAllProducts() async {
    return await _databaseHelper.getAllProducts();
  }

  Future<Product?> getProductById(String id) async {
    return await _databaseHelper.getProductById(id);
  }

  Future<int> addProduct(Product product) async {
    return await _databaseHelper.insertProduct(product);
  }

  Future<int> updateProduct(Product product) async {
    return await _databaseHelper.updateProduct(product);
  }

  Future<int> deleteProduct(String id) async {
    return await _databaseHelper.deleteProduct(id);
  }
}
