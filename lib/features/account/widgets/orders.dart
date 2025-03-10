import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/features/account/widgets/single_product.dart';
import 'package:e_comm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://plus.unsplash.com/premium_photo-1740992237716-2bb9f560cc6b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0NXx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1740992237716-2bb9f560cc6b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0NXx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1740992237716-2bb9f560cc6b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0NXx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1740992237716-2bb9f560cc6b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0NXx8fGVufDB8fHx8fA%3D%3D'
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(left: 15),
                child: Text('Your Orders',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
            Container(
                padding: EdgeInsets.only(left: 15),
                child: Text('See All',
                    style:
                        TextStyle(color: GlobalVariables.selectedNavBarColor))),
          ],
        ),
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: ((context, index) {
                return SingleProduct(image: list[index]);
              })),
        )
      ],
    );
  }
}
