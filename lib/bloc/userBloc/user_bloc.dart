import 'package:ecommerce/bloc/userBloc/userbloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository})
      : assert(userRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    print("Miki");
    if (event is UserLoad) {
      yield UserLoading();
      try {
        final users = await userRepository.getUsers();
        yield UsersLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserCreate) {
      try {
        print("TTTTTTTTT");
        await userRepository.createUser(event.user);
        //final users = await userRepository.getUsers();

        yield UsersLoadSuccess();
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserLogin) {
      try {
        print("trying");
        final users = await userRepository.loginUser(event.user);

        //final users = await userRepository.getUsers();
        //List<User> u = [User(email: "dd")];
        print("succes");
        yield UsersLoadSuccess();
      } catch (_) {
        print(_);
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      try {
        await userRepository.updateUser(event.user);
        final places = await userRepository.getUsers();
        yield UsersLoadSuccess(places);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteUser(event.user);
        final places = await userRepository.getUsers();
        yield UsersLoadSuccess(places);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
  }
}
