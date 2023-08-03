import 'package:artravel/cubit/app_cubit_states.dart';
import 'package:artravel/services/data_services.dart';
import 'package:bloc/bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final locations;

  void getData() async {
    try {
      emit(LoadingState());
      locations = await data.getInfo();
      emit(LoadedState(locations));
    } catch (ex) {}
  }
}
