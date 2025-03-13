import 'package:e_comm/common/widgets/starts.dart';
import 'package:e_comm/models/product.dart';
import 'package:e_comm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.network(product.images[0],
                    fit: BoxFit.fitHeight, height: 135, width: 135),
                Column(
                  children: [
                    Container(
                        width: 235,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(product.name,
                            style: TextStyle(fontSize: 16), maxLines: 2)),
                    Container(
                        width: 235,
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Stars(rating: avgRating)),
                    Container(
                        width: 235,
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text('\$${product.price}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            maxLines: 2)),
                    Container(
                        width: 235,
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Eligible fro FREE Shipping',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            maxLines: 2)),
                    Container(
                        width: 235,
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text('In Stock',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                            maxLines: 2)),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
