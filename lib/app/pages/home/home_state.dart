import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../dto/dto.dart';
import '../../models/models.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState({
    this.errorMessage,
    required this.shoppingBag,
    required this.status,
    required this.products,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        errorMessage = null,
        shoppingBag = const [];

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith(
      {HomeStateStatus? status,
      List<ProductModel>? products,
      String? errorMessage,
      List<OrderProductDto>? shoppingBag}) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shoppingBag: shoppingBag ?? this.shoppingBag,
    );
  }
}
