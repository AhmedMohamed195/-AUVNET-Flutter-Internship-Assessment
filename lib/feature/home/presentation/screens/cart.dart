import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
import '../bloc/favorite_bloc.dart';
import '../bloc/favorite_event.dart';
import '../bloc/favorite_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(
          "My Favorites",
          style: TextStyle(
            fontSize: getResponsiveFontSize(context: context, fontSize: 23),
            fontWeight: FontWeight.bold,
          ),
        ),),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoaded) {
            final favorites = state.favorites;

            if (favorites.isEmpty) {
              return const Center(child: Text('No favorites added.'));
            }

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];

                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.01,
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      item.image,
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                    ),
                    title: Text(item.text1),
                    subtitle: Text(item.text2),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<FavoriteBloc>().add(
                          RemoveFavoriteEvent(item),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Something went wrong.'));
          }
        },
      ),
    );
  }
}
