import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginbloc.dart';
import 'loginscreen.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider
      (providers:
      [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
      ],
      child:MaterialApp(home:LoginScreen()),


      );
  }
}
