import 'package:bloc/bloc.dart';
import 'package:vakinha_burger/app/pages/order/order_state.dart';

class OrderController extends Cubit<OrderState> {
  OrderController() : super(const OrderState.initial());
}
