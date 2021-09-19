class ChatModel {
  final String name;
  String message = '';
  final String time;
  final String imageUrl;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.imageUrl});
}

List<ChatModel> messageData = [
  ChatModel(
      name: "Martin Fowler",
      message: "Hola como estas?",
      time: "17:30",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Martin_Fowler_%282008%29.jpg/1200px-Martin_Fowler_%282008%29.jpg"),
  ChatModel(
      name: "Linux Tolvar",
      message: "Me encanta flutter!",
      time: "15:30",
      imageUrl: "https://avatars0.githubusercontent.com/u/1024025?s=460&v=4"),
  ChatModel(
      name: "Steve Wozniak",
      message: "Wassup !",
      time: "12:30",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Steve_Wozniak_by_Gage_Skidmore_3_%28cropped%29.jpg/640px-Steve_Wozniak_by_Gage_Skidmore_3_%28cropped%29.jpg"),
  ChatModel(
      name: "Robert Martin",
      message: "bye!",
      time: "10:30",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Robert_Cecil_Martin.png/220px-Robert_Cecil_Martin.png"),
  ChatModel(
      name: "Dennis Ritchie",
      message: "Nos vemos más tarde",
      time: "5:00",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Dennis_Ritchie_2011.jpg/220px-Dennis_Ritchie_2011.jpg"),
  ChatModel(
      name: "Satya Nadella",
      message: "buenos días",
      time: "yesterday",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/MS-Exec-Nadella-Satya-2017-08-31-22_%28cropped%29.jpg/640px-MS-Exec-Nadella-Satya-2017-08-31-22_%28cropped%29.jpg"),
];
