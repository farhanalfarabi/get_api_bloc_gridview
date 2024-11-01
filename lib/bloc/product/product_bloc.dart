import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_get_api_use_gridviewbuilder/model/product_model.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final response = await http.get(Uri.parse(
          "https://api.escuelajs.co/api/v1/products?offset=0&limit=10"));
      emit(ProductSuccess(products: productFromJson(response.body)));
    });
  }
}
