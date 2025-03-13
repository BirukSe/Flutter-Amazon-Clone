import 'dart:convert';

import 'package:e_comm/constants/error_handling.dart';
import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/constants/utils.dart';
import 'package:e_comm/models/product.dart';
import 'package:e_comm/models/user.dart';
import 'package:e_comm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(
          Uri.parse('$uri/api/remove-from-cart/${product.id}'),
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': userProvider.user.token
          },
          body: jsonEncode({
            'id': product.id,
          }));
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            User user =
                userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
            userProvider.setUserFromModel(user);
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }
}
