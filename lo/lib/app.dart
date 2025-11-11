import 'package:eotc_melodies/features/auth/presentation/blocs/auth_cubit.dart';
import 'package:eotc_melodies/injection.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/pages/signup_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => di.sl<AuthCubit>(),
        child: const SignupPage(),
      ),
    );
  }
}
