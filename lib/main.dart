import 'package:flutter/material.dart';
import 'package:stagetime/models/user.dart';
import 'package:stagetime/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:stagetime/services/auth.dart';Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value:AuthService().user,
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
