import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_get_api_use_gridviewbuilder/bloc/bloc/user_bloc.dart';
import 'package:latihan_get_api_use_gridviewbuilder/bloc/product/product_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductSuccess) {
            return GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return GridTile(
                  header: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is UserSuccess) {
                        return GridTileBar(
                          title: Text(
                            state.users[index].name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          // leading: Image.network(state.users[index].avatar),
                        );
                      }
                      return const Center(
                        child: Text("NO USER"),
                      );
                    },
                  ),
                  footer: GridTileBar(
                    title: Text(product.title),
                    subtitle: Text("${product.price} USD"),
                    backgroundColor: Colors.black54,
                  ),
                  child: Image.network(product.images[2]),
                );
              },
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
