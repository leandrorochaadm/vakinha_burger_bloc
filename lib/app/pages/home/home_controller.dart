import 'package:bloc/bloc.dart';

import '../../repositories/repositories.dart';
import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));

    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e) {
      throw Exception('Erro ao buscar produtos');
    }
  }
}
