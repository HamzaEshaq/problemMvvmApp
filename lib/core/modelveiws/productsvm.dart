import 'package:dio/dio.dart';
import 'package:products/core/constants/api_routes.dart';
import 'package:products/core/models/product.dart';
import 'package:products/core/models/user.dart';
import 'package:products/helpers/http_helper.dart';

class ProductsVM{
  
  Future<List<Product>>getProductsFromServer()async{
    HttpHelper http=HttpHelper.instance;
    Response res=await http.get(APIRoutes.PRODUCTSURL);

    print("the status code is ${res.data!}");
    return buildProductList(res.data!);



  }

  List<Product>buildProductList(List<dynamic> data){
    try{
   List<Product> xxxx= data.map((item)=>Product.fromJson(item)).toList();
   return xxxx;
    }

    catch(e){
      print(" pppp $e");

    }
    return [];
  }

  getSingleProductDetails(int id){
    HttpHelper http=HttpHelper.instance;
    http.get("https://dummyjson.com/prducts/$id");

  }

}