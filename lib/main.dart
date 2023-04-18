// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import './auth/bloc_auth/login_bloc.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'auth/models/user_model.dart';
// import 'auth/repository/user_repository.dart';

// import 'package:http/http.dart' as http;

// import './auth/services/authentication_service.dart';

// import './auth/pages/loginPage.dart';

// void main() {
//   final userRepository = UserRepository();
//   runApp(
//     BlocProvider(
//       create: (context) => LoginBloc(userRepository: userRepository),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: BlocListener<LoginBloc, LoginState>(
//           listener: (context, state) {
//             // Handle state changes
//           },
//           child: BlocBuilder<LoginBloc, LoginState>(
//             builder: (context, state) {
//               // Build UI based on the state
//               return Container();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final UserRepository userRepository = UserRepository(
//     apiService: ApiService(dio: Dio()),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginBloc>(
//           create: (context) => LoginBloc(
//             userRepository: userRepository,
//             apiService: ApiService(dio: Dio()),
//             currentUser:
//                 User(id: 0, username: '', password: '', email: '', token: ''),
//           ),
//         ),
//         // Add additional bloc providers here if necessary
//       ],
//       child: MaterialApp(
//         title: 'Flutter Bloc Login',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: LoginPage(),
//       ),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/LoginBloc.dart';
import 'bloc/screens/LoginPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(
    Builder(
      builder: (context) => MyApp(
        loginBloc: LoginBloc(dio: Dio(), context: context),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Dio dio = Dio();
  final LoginBloc loginBloc;

  MyApp({Key? key, required this.loginBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Demo',
      home: BlocProvider<LoginBloc>(
        create: (context) => loginBloc,
        child: LoginPage(loginBloc: loginBloc),
      ),
    );
  }
}
