// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc_auth/login_bloc.dart';

// class LoginForm extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: emailController,
//           decoration: InputDecoration(
//             labelText: 'Email',
//           ),
//         ),
//         TextField(
//           controller: passwordController,
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: 'Password',
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             context.read<LoginBloc>().add(LoginButtonPressed(
//                   email: emailController.text,
//                   password: passwordController.text,
//                 ));
//           },
//           child: Text('Login'),
//         ),
//       ],
//     );
//   }
// }
