import 'package:flutter/material.dart';
import 'package:products/core/views/products_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductsScreen(),);
  }
}
