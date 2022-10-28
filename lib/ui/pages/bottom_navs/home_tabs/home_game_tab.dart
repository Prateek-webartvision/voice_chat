import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voice_chat/models/games_model.dart';

class HomeGameTab extends StatelessWidget {
  const HomeGameTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: games.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: CachedNetworkImage(
                    imageUrl: games[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Text(
                      games[index].score.toString(),
                      style: textTheme.headlineMedium,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
