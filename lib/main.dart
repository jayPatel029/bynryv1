import 'package:bynryv1/firebase_options.dart';
import 'package:bynryv1/repos/auth_repo/auth_repo.dart';
import 'package:bynryv1/repos/auth_repo/repos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'screens/screens.dart';

 Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // RegisterScreen(),
          // LoginScreen(),
          // HomeScreen(),
      // ForgotPass()
        Wrapper(),
    );

  }
}

//
// class AppView extends StatelessWidget {
//   const AppView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FlowBuilder(
//         state: context.select((AppBloc bloc) => bloc.state.status),
//         onGeneratePages: onGenerateViewPages,
//       ),
//     );
//   }
// }
