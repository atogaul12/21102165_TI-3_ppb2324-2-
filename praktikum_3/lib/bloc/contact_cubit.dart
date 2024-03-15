import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../model/user.dart';
part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  List<User> users = [];

  void addContact({required String username, required int number}) {
    emit(ContactInitial());
    users.add(User(name: username, number: number));
    emit(ContactLoading());
    Future.delayed(const Duration(seconds: 3), () => emit(ContactLoaded(users: users)));
  }

  void removeUser({required int index}) {
    emit(ContactInitial());
    users.removeAt(index);
    if (users.isEmpty) {
      emit(ContactInitial());
    } else {
      emit(ContactLoaded(users: users));
    }
  }
}
