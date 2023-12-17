import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntax_course/EGYbest/presentation/manager/cubit/cubit.dart';
import 'package:syntax_course/EGYbest/presentation/manager/states/state.dart';
import 'package:syntax_course/EGYbest/presentation/view/widget/movie_item.dart';
import 'package:syntax_course/EGYbest/core/utils/app_string.dart';
import 'package:syntax_course/EGYbest/core/utils/colors.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovie(),
      child: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: AppColors.white,
              title: Text(
                AppStrings.appName,
                style: TextStyle(
                  color: AppColors.darkBlue,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.pageRemove();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: AppColors.darkBlue,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${cubit.page}",
                    style: TextStyle(fontSize: 20, color: AppColors.darkBlue),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      cubit.pageAdd();
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.darkBlue,
                    )),
              ],
            ),
            body: BlocBuilder<MovieCubit, MovieStates>(
              builder: (context, state) {
                if (state is MovieLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.pink,
                    ),
                  );
                } else if (state is MovieErrState) {
                  return Center(child: Text("Err"));
                }
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.separated(
                            itemBuilder: (context, index) => buildMovieItem(
                                context.read<MovieCubit>().allLsit[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 15,
                                ),
                            itemCount: cubit.allLsit.length),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
