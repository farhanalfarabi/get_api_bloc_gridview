import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_get_api_use_gridviewbuilder/model/user_model.dart';
import 'package:http/http.dart' as http;
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<OnGetUserEvent>((event, emit) async {
      emit(UserLoading());
      final response =
          await http.get(Uri.parse("https://api.escuelajs.co/api/v1/users"));
      emit(UserSuccess(users: userFromJson(response.body)));
    });
  }
}
