import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;


class WorkoutController extends GetxController {


  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

   Future<String?> fetchData() async {
    final url = 'https://www.bodybuilding.com/exercises/triceps-pushdown'; // replace with the URL of the bodybuilding website's video page

    final response = await http.get(Uri.parse(url));
    final document = parser.parse(response.body);

    final videoElement = document.getElementsByTagName('video').first;
    final videoUrl = videoElement.attributes['src'];

    return videoUrl; // this will return the direct URL to the video
  }


}