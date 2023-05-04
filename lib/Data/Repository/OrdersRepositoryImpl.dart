import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';

class OrdersRepositoryImpl implements OrdersRepository{
  OrdersRemoteDataSource remoteDataSource;
  OrdersRepositoryImpl (this.remoteDataSource);

  @override
  Future<OrderResponse> placeOrder(Order order) async{
    var response = await remoteDataSource.placeOrder(order);
    return response;
  }
}