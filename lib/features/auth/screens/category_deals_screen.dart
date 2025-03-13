import 'package:e_comm/common/widgets/loader.dart';
import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/features/auth/services/home_services.dart';
import 'package:e_comm/features/product_detail/screens/product_detail_screen.dart';
import 'package:e_comm/models/product.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
                flexibleSpace: Container(
                  decoration:
                      BoxDecoration(gradient: GlobalVariables.appBarGradient),
                ),
                title: Text(widget.category,
                    style: TextStyle(color: Colors.black)))),
        body: productList == null
            ? Loader()
            : Column(
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      alignment: Alignment.topLeft,
                      child: Text('Keep shopping for ${widget.category}',
                          style: TextStyle(fontSize: 20))),
                  SizedBox(
                      height: 170,
                      child: GridView.builder(
                          itemCount: productList!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 1.4,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            final product = productList![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetailScreen.routeName,
                                    arguments: product);
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 130,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black12,
                                                  width: 0.5)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Image.network(
                                                product.images[0]),
                                          ))),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(
                                          left: 0, top: 5, right: 15),
                                      child: Text(
                                        product.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                ],
                              ),
                            );
                          }))
                ],
              ));
  }
}
