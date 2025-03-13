import 'package:e_comm/features/auth/screens/auth_screen.dart';
import 'package:e_comm/features/auth/screens/home_screen.dart';
import 'package:e_comm/models/product.dart';
import 'package:flutter/material.dart';
import './common/widgets/bottom_bar.dart';
import './features/admin/screens/add_product_screen.dart';
import './features/auth/screens/category_deals_screen.dart';
import './features/search/screens/search_screen.dart';
import './features/product_detail/screens/product_detail_screen.dart';
import './features/address/screens/address_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AddProductScreen());
    case AddressScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AddressScreen());
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductDetailScreen(product: product));
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                searchQuery: searchQuery,
              ));
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealsScreen(
                category: category,
              ));
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: Center(
                child: Text('Screen does not exist'),
              )));
  }
}
