import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greenpath_20/screens/add-cultivation-screen.dart';
import 'package:greenpath_20/screens/create-farmer-account-screen.dart';
import 'package:greenpath_20/screens/create-investor-account-screen.dart';
import 'package:greenpath_20/screens/cultivation-screen.dart';
import 'package:greenpath_20/screens/dashboard-farmer-screen.dart';
import 'package:greenpath_20/screens/dashboard-investor-screen.dart';
import 'package:greenpath_20/screens/enter-verification-screen.dart';
import 'package:greenpath_20/screens/forgot-password-screen.dart';
import 'package:greenpath_20/screens/get-started-screen.dart';
import 'package:greenpath_20/screens/login-farmer-screen.dart';
import 'package:greenpath_20/screens/login-investor-screen.dart';
import 'package:greenpath_20/screens/login-selection-screen.dart';
import 'package:greenpath_20/screens/register-farmer-screen.dart';
import 'package:greenpath_20/screens/register-investor-one-screen.dart';
import 'package:greenpath_20/screens/register-investor-two-screen.dart';
import 'package:greenpath_20/screens/reset-password-screen.dart';
import 'package:greenpath_20/services/auth-service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDJTJmc8H3GLUHdPVn8LTSJkS5scYkeQdA", // Your apiKey
      appId: "1:63086022703:android:37f75a766095acd3c676da", // Your appId
      messagingSenderId: "63086022703", // Your messagingSenderId
      projectId: "greenpath-db", // Your projectId
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AuthService())],
      child: Consumer<AuthService>(
        builder: (ctx, auth, _) => MaterialApp(
          theme: ThemeData(
              colorScheme:
                  ThemeData().colorScheme.copyWith(primary: Colors.green)),
          debugShowCheckedModeBanner: false,
          title: 'Greenpath v1.0',
          home: GetStartedScreen(),
          routes: {
            LoginSelectionScreen.routeName: (ctx) =>
                const LoginSelectionScreen(),
            LoginFarmerScreen.routeName: (ctx) => const LoginFarmerScreen(),
            LoginInvestorScreen.routeName: (ctx) => const LoginInvestorScreen(),
            RegisterFarmerScreen.routeName: (ctx) =>
                const RegisterFarmerScreen(),
            ForgotPasswordScreen.routeName: (ctx) =>
                const ForgotPasswordScreen(),
            RegisterInvestorOneScreen.routeName: (ctx) =>
                const RegisterInvestorOneScreen(),
            RegisterInvestorTwoScreen.routeName: (ctx) =>
                const RegisterInvestorTwoScreen(),
            DashboardFarmerScreen.routeName: (ctx) =>
                DashboardFarmerScreen(userEmail: auth.userEmail),
            DashboardInvestorScreen.routeName: (ctx) =>
                DashboardInvestorScreen(userEmail: auth.userEmail),
            CultivationScreen.routeName: (ctx) =>
                CultivationScreen(userEmail: auth.userEmail),
            CreateFarmerAccountScreen.routeName: (ctx) =>
                const CreateFarmerAccountScreen(),
            CreateInvestorAccountScreen.routeName: (ctx) =>
                const CreateInvestorAccountScreen(),
            ResetPasswordScreen.routeName: (ctx) => const ResetPasswordScreen(),
            AddCultivationScreen.routeName: (ctx) =>
                const AddCultivationScreen()
          },
        ),
      ),
    );
  }
}
