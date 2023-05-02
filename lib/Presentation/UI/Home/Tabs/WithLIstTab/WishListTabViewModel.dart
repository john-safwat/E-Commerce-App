import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetWishListProductsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/WithLIstTab/WishListTabNavigator.dart';
import 'package:flutter/material.dart';

class WishListTabViewModel extends ChangeNotifier{
  GetWishListProductsUseCase getWishListProductsUseCase ;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  WishListTabViewModel(this.getWishListProductsUseCase , this.deleteFromWishListUseCase);
  WishListTabNavigator? navigator;
  List<Product>? products ;
  String? errorMessage ;

  void getProducts() async{
    products = null;
    errorMessage = null;
    try{
      var response = await getWishListProductsUseCase.invoke();
      products = response;
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress(){
    getProducts();
  }

  void onViewNowPress(Product product){
    navigator!.goToProductDetailsScreen(product);
  }

  void onDeletePress(Product product)async{
    navigator!.showLoading();
    var response = await deleteFromWishListUseCase.invoke(int.parse(product.id!.toString()));
    navigator!.hideDialog();
    navigator!.showSuccessMessage(response);
    getProducts();
  }
}