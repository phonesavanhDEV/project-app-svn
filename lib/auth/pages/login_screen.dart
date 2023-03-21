// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc_auth/login_bloc.dart';
// import '../services/authentication_service.dart';

// import 'login_form.dart';

// class LoginScreen extends StatelessWidget {
//   final AuthService authService;

//   LoginScreen({required this.authService});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: BlocProvider(
//         create: (context) => LoginBloc(authService: authService),
//         child: BlocConsumer<LoginBloc, LoginState>(
//           listener: (context, state) {
//             if (state is LoginSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Logged in successfully'),
//                 ),
//               );
//             } else if (state is LoginFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(state.error),
//                 ),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is LoginLoading) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: LoginForm(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
