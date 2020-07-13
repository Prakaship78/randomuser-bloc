import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/randomUser_bloc.dart';
import 'data/repositories/randomuser_repository.dart';
import 'ui/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc RandomUser',
      home: BlocProvider(
        create: (context) => RandomUserBloc(repository: RandomUserImpl()),
        child: HomePage(),
      ),
    );
  }
}
