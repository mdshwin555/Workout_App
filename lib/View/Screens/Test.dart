import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/Api/HtmlVideoController.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

Future<String?> fetchData() async {
  final url = 'https://www.bodybuilding.com/exercises/triceps-pushdown'; // replace with the URL of the bodybuilding website's video page

  final response = await http.get(Uri.parse(url));
  final document = parser.parse(response.body);

  final videoElement = document.getElementsByTagName('video').first;
  final videoUrl = videoElement.attributes['src'];

  return videoUrl; // this will return the direct URL to the video
}
class _WorkoutPageState extends State<WorkoutPage> {
  final WorkoutController _controller = Get.find();
  final _controllerr=Get.put(WorkoutController());

  @override
  void initState() {
    super.initState();
    fetchData();
    //_controllerr.fetchData();
    //print(_controllerr.fetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Page'),
      ),
      body: Center(
        child: Obx(
              () => Text(''),
        ),
      ),
    );
  }
}
