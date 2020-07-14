import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomuserbloc/bloc/randomUser_bloc.dart';
import 'package:randomuserbloc/bloc/randomUser_event.dart';
import 'package:randomuserbloc/bloc/randomUser_state.dart';
import 'package:randomuserbloc/data/models/api_result_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RandomUserBloc resultBloc;

  @override
  void initState() {
    super.initState();
    resultBloc = BlocProvider.of<RandomUserBloc>(context);
    resultBloc.add(FetchRandomuserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Random user bloc'),
            ),
            body: Container(
              child: BlocListener<RandomUserBloc, RandomUserState>(
                listener: (context, state) {
                  if (state is RandomUserErrorState) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: BlocBuilder<RandomUserBloc, RandomUserState>(
                    builder: (context, state) {
                  if (state is RandomUserInitialState) {
                    return buildIsLoading();
                  } else if (state is RandomUserLoadingState) {
                    return buildIsLoading();
                  } else if (state is RandomUserLoadedlState) {
                    print(state.results);
                    return buildRandomUserList(state.results);
                  } else if (state is RandomUserErrorState) {
                    return buildErrorUi(state.message);
                  }
                }),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildIsLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildRandomUserList(List<User> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: InkWell(
            child: ListTile(
              leading: ClipOval(
                  // child: Hero(
                  //     tag: results[pos]['gender'],
                  //     child: results[pos]['gender'] != null
                  //         ? Image.network(
                  //             results[pos]['gender'],
                  //             fit: BoxFit.cover,
                  //             height: 70,
                  //             width: 70,
                  //           )
                  //         : Container()),
                  ),
              title: Text(results[pos].gender),
              subtitle: Text(results[pos].email),
            ),
          ),
        );
      },
    );
  }
}
