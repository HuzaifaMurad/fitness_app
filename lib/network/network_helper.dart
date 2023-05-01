import 'dart:developer';

import 'package:fitness_king/modal/exercise.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
//  const req = unirest("GET", "https://exercisedb.p.rapidapi.com/exercises/bodyPartList");

// req.headers({
// 	"X-RapidAPI-Key": "9ecec8d254msh6e794e12b6272f7p176861jsnda7d2738eb13",
// 	"X-RapidAPI-Host": "exercisedb.p.rapidapi.com",
// 	"useQueryString": true
// });

// req.end(function (res) {
// 	if (res.error) throw new Error(res.error);

// 	console.log(res.body);
// });

  static Future getData() async {
    var uri = Uri.https('exercisedb.p.rapidapi.com', '/exercises');

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "9ecec8d254msh6e794e12b6272f7p176861jsnda7d2738eb13",
      "X-RapidAPI-Host": "exercisedb.p.rapidapi.com",
      "useQueryString": " true"
    });

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      for (int i = 0; i < 1200; i++) {
        Exercise.allExercise.insert(
            0,
            Exercise(
                id: decodedData[i]['id'],
                bodyPart: decodedData[i]['bodyPart'],
                equipment: decodedData[i]['equipment'],
                imageUrl: decodedData[i]['gifUrl'],
                name: decodedData[i]['name'],
                target: decodedData[i]['target']));
      }
      log(Exercise.allExercise[0].toString());
    } else {
      print(response.statusCode);
    }
  }
}
