class Exercise {
  String? id;
  String? bodyPart;
  String? equipment;
  String? imageUrl;
  String? name;
  String? target;

  Exercise(
      {required this.id,
      required this.bodyPart,
      required this.equipment,
      required this.imageUrl,
      required this.name,
      required this.target});

  static List<Exercise> allExercise = [];
}
