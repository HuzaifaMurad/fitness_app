import 'package:fitness_king/modal/displayExercise.dart';
import 'package:fitness_king/modal/exercise.dart';
import 'package:get/get.dart';

class DispExerciseController extends GetxController {
  final Rx<List<Exercise>> option = Rx<List<Exercise>>([]);
  void addToOption(Exercise exercise) {
    option.value.insert(
        0,
        Exercise(
            id: exercise.id,
            bodyPart: exercise.bodyPart,
            equipment: exercise.equipment,
            imageUrl: exercise.imageUrl,
            name: exercise.name,
            target: exercise.target));
  }

  final Rx<List<DispExercise>> exerciseList = Rx<List<DispExercise>>([
    DispExercise(
        imageUrl:
            'https://media.istockphoto.com/photos/muscular-man-workout-in-gym-doing-exercises-for-chest-cable-crossover-picture-id1151758521?s=170667a',
        level: 'intermidate',
        time: '60 minutes',
        title: 'chest'),
    DispExercise(
        imageUrl:
            'https://c4.wallpaperflare.com/wallpaper/565/506/328/sports-wallpaper-preview.jpg',
        level: 'intermidate',
        time: '30 minutes',
        title: 'biceps'),
    DispExercise(
        imageUrl:
            'https://images.unsplash.com/photo-1603287681836-b174ce5074c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmFjayUyMHdvcmtvdXR8ZW58MHx8MHx8&w=1000&q=80',
        level: 'intermidate',
        time: '45 minutes',
        title: 'Wings'),
    DispExercise(
        imageUrl:
            'https://thumbs.dreamstime.com/b/sexy-muscular-man-posing-gym-shaped-abdominal-showing-triceps-strong-male-naked-torso-abs-working-out-103265466.jpg',
        level: 'intermidate',
        time: '20 minutes',
        title: 'triceps'),
    DispExercise(
        imageUrl:
            'https://c4.wallpaperflare.com/wallpaper/215/726/470/muscles-workout-gym-bodybuilder-wallpaper-preview.jpg',
        level: 'intermidate',
        time: '50 minutes',
        title: 'legs'),
    DispExercise(
        imageUrl:
            'https://cdn.shopify.com/s/files/1/1286/2401/articles/Best-Shoulder-Workouts-for-Hardcore-Bodybuilders_1024x1024.jpg?v=1477558330',
        level: 'intermidate',
        time: '30 minutes',
        title: 'shoulder'),
  ]);
}
