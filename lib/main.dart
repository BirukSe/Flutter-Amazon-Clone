import 'package:e_comm/common/widgets/bottom_bar.dart';
import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/features/admin/screens/admin_screen.dart';
import 'package:e_comm/features/auth/screens/auth_screen.dart';
import 'package:e_comm/features/auth/screens/home_screen.dart';
import 'package:e_comm/features/auth/services/auth_service.dart';
import 'package:e_comm/providers/user_provider.dart';
import 'package:e_comm/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazon Clone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? BottomBar()
                : AdminScreen()
            : AuthScreen());
  }
}
