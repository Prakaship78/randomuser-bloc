import 'package:bloc/bloc.dart';
import 'package:randomuserbloc/bloc/randomUser_event.dart';
import 'package:randomuserbloc/bloc/randomUser_state.dart';
import 'package:randomuserbloc/data/models/api_result_model.dart';
import 'package:randomuserbloc/data/repositories/randomuser_repository.dart';
import 'package:meta/meta.dart';

class RandomUserBloc extends Bloc<RandomUserEvent, RandomUserState> {
  RandomUserRepository repository;
  RandomUserBloc({@required this.repository});
  @override
  RandomUserState get initialState => RandomUserInitialState();

  @override
  Stream<RandomUserState> mapEventToState(RandomUserEvent event) async* {
    if (event is FetchRandomuserEvent) {
      yield RandomUserLoadingState();
      try {
        List<User> results = await repository.getRandomUser();
        // print(results[0].gender);
        yield RandomUserLoadedlState(results: results);
      } catch (e) {
        RandomUserErrorState(message: e.toString());
      }
    }
  }
}
