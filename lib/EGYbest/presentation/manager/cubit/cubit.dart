//https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=1
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntax_course/EGYbest/models/model.dart';
import 'package:syntax_course/EGYbest/presentation/manager/states/state.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitState());

  static MovieCubit get(context) => BlocProvider.of(context);

  int page = 1;
  List allLsit = [];

  void getMovie() async {
    emit(MovieLoadingState());
    try {
      final response = await Dio().get(
          "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page");
      var model = MovieModel.fromJson(response.data);
      allLsit = model.results;
      emit(MovieSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(MovieErrState());
    }
  }

  void pageAdd() async {
    emit(MovieLoadingState());
    try {
      page++;
      final response = await Dio().get(
          "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page");
      var model = MovieModel.fromJson(response.data);
      allLsit = model.results;
      emit(MovieSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(MovieErrState());
    }
  }

  void pageRemove() async {
    emit(MovieLoadingState());
    try {
      if (page > 1) {
        page--;
      }
      final response = await Dio().get(
          "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page");
      var model = MovieModel.fromJson(response.data);
      allLsit = model.results;

      emit(MovieSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(MovieErrState());
    }
  }
}
