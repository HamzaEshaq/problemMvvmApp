import 'package:flutter/material.dart';
import 'package:products/core/models/product.dart';
import 'package:products/core/modelveiws/productsvm.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsVM productsVM=ProductsVM();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
    body: FutureBuilder<List<Product>>(future: productsVM.getProductsFromServer(), builder:(ctx,snapshot){

      if(snapshot.connectionState==ConnectionState.done){
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx,index){
                return Container(child: Image.network(snapshot.data![index].thumbnail!),);
              });
        }
        else
          return Center(child: Text("No Products avliable"),);
      }
      else
        return Center(child: CircularProgressIndicator(),);

    }),

    );
  }
}
