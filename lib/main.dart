import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'Constants/Routes.dart';
import 'View/Screens/Onboarding/onboarding.dart';

SharedPreferences? sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, DeviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: Routes.onboarding,
            page: () => OnBoarding(),
          ),
        ],
        initialRoute: Routes.onboarding,
      ),
    );
  }
}
