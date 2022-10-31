class GameModel {
  final String name;
  final String image;
  final int score;

  GameModel({
    required this.name,
    required this.image,
    required this.score,
  });
}

List<GameModel> games = [
  GameModel(
    name: "Lucky Number",
    image:
        "https://www.oregonlottery.org/wp-content/uploads/2021/12/1468_LuckyNumbers_GameTile_1200x1200.jpg",
    score: 120,
  ),
  GameModel(
    name: "Roulette",
    image: "http://www.murderousmaths.co.uk/books/roulette/wheel%200.jpg",
    score: 11,
  ),
  GameModel(
    name: "Dice Game",
    image: "https://m.media-amazon.com/images/I/71oCXkId4cL.png",
    score: 250,
  ),
  GameModel(
    name: "Lucky Box",
    image: "https://i.imgur.com/ztyb5L6.jpg",
    score: 100,
  ),
];
