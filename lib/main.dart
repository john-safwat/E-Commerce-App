import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Home/HomeScreenView.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenView.dart';
import 'package:ecommerce/Presentation/UI/PickImage/PickImageScreenView.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListView.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dcdg/dcdg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  String? token = pref.getString("token");
  token ??= '';
  runApp(ChangeNotifierProvider(create: (context) => AppConfigProvider(), child: MyApp(token)));
}

class MyApp extends StatelessWidget {
  String token;
  MyApp(this.token);
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    provider.updateToken(token);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        RegistrationScreen.routeName: (_) => RegistrationScreen(),
        PickImageScreen.routeName: (_) => PickImageScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ProductsListScreen.routeName:(_)=> ProductsListScreen()
      },

      home: AnimatedSplashScreen(
        splash: 'assets/images/Logo.png',
        backgroundColor: MyTheme.backGround,
        nextScreen: token.isEmpty?LoginScreen() : HomeScreen(),
        duration: 3000,
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.scaleTransition,
      ),

      theme: MyTheme.darkTheme,
    );
  }
}
