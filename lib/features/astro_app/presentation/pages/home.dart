import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_1/features/astro_app/presentation/bloc/question_bloc/questions_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuestionsBloc>(context).add(GetQuestionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: BlocConsumer<QuestionsBloc, QuestionsState>(
          builder: (BuildContext context, state) {
            if (state is QuestionsInitial) {
              return Center(
                child: Text('Loading.....'),
              );
            } else if (state is QuestionsLoaded) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("[TODO]"),
                    ListView(
                      shrinkWrap: true,
                      children:
                          state.questions.map((e) => Text(e.name)).toList(),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text('Error.....'),
              );
            }
          },
          listener: (BuildContext context, state) {},
        ));
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/hamburger.png",
            fit: BoxFit.scaleDown,
            height: kToolbarHeight,
          ),
          Image.asset(
            "assets/images/icon.png",
            fit: BoxFit.fitHeight,
            height: kToolbarHeight,
          ),
          Image.asset(
            "assets/images/profile.png",
            fit: BoxFit.fitHeight,
            height: kToolbarHeight / 2,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
