import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
import '../../domain/entities/categories3_entity.dart';
import '../bloc/favorite_bloc.dart';
import '../bloc/favorite_event.dart';
import '../bloc/favorite_state.dart';

class CustomCategoriesThree extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;

  const CustomCategoriesThree({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final item = Categories3(image: image, text1: text1, text2: text2);

    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final isFavorite =
            state is FavoriteLoaded &&
            state.favorites.any((e) => e.text1 == item.text1);

        return Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: Card(
                    child: Container(
                      height: screenHeight * 0.085,
                      width: screenWidth * 0.19,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.025,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(40),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.005),
                          child: Image.asset(image, fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * -0.012,
                  right: screenWidth * -0.03,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: screenWidth * 0.06,
                    ),
                    onPressed: () {
                      if (isFavorite) {
                        context.read<FavoriteBloc>().add(
                          RemoveFavoriteEvent(item),
                        );
                      } else {
                        context.read<FavoriteBloc>().add(
                          AddFavoriteEvent(item),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
              SizedBox(height: screenHeight * 0.008),
           Text(
          text1,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context: context, fontSize: 12),
            color: Colors.black,
          ),
        ),
           Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.watch_later_outlined, size: screenWidth * 0.032),
            SizedBox(width: screenWidth * 0.015),
            Text(
              text2,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context: context, fontSize: 12),
                color: Colors.grey,
              ),
            ),
          ],
        ),
          ],
        );
      },
    );
  }
}
