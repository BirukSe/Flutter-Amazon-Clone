import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:e_comm/constants/error_handling.dart';
import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/constants/utils.dart';
import 'package:e_comm/models/product.dart';
import 'package:e_comm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('druo4ct6p', 'amazonApp');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
          category: category,
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          price: price);

      http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': userProvider.user.token
          },
          body: product.toJson());
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product added successfully');
            Navigator.pop(context);
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  Future<List<Product>> fetchAppProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(Uri.parse('$uri/admin/get-products'),
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': userProvider.user.token
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (ee) {
      showSnackBar(context, ee.toString());
    }
    return productList;
  }

  void deleteProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(Uri.parse('$uri/delete-product'),
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': userProvider.user.token
          },
          body: jsonEncode({'id': product.id}));
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            onSuccess();
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }
}
