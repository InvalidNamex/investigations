import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigations/views/management_screen.dart';
import 'package:investigations/views/users/login_user.dart';
import 'package:investigations/views/users/register_user.dart';

import '/views/404_screen.dart';
import '/views/home_screen.dart';
import 'helpers/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'برنامج التحقيقات والجزاءات',
      locale: const Locale('ar', 'EG'),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/Confound', page: () => const NotFound()),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: HomeBinding(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(milliseconds: 200)),
        GetPage(
            name: '/management',
            page: () => const ManagementScreen(),
            binding: HomeBinding(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(milliseconds: 200)),
        GetPage(
            name: '/',
            page: () => const UserLogin(),
            binding: UsersBinding(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 200)),
        GetPage(
            name: '/register',
            page: () => const UserRegister(),
            binding: UsersBinding(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(milliseconds: 200)),
      ],
    );
  }
}
