import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../dto/dto.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;

  const OrderState({
    required this.status,
    required this.orderProducts,
  });

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const <OrderProductDto>[];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
