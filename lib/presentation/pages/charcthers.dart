import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_flutter/business_logic/cubit/charcthers_cubit_cubit.dart';
import 'package:movie_bloc_flutter/constants/colors.dart';
import 'package:movie_bloc_flutter/data/models/charcthers_model.dart';
import 'package:movie_bloc_flutter/presentation/widgets/widgets.dart';

class CharctersPage extends StatefulWidget {
  const CharctersPage({Key? key}) : super(key: key);

  @override
  _CharctersPageState createState() => _CharctersPageState();
}

class _CharctersPageState extends State<CharctersPage> {
  late List<CharcthersModel> allCharcthers;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<CharcthersCubit>(context).getAllCharcthers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        title: Text(
          "Charcters".toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CharcthersCubit, CharcthersCubitState>(
        builder: (context, state) {
          if (state is CharcthersLoaded) {
            allCharcthers = (state).charcthers;
            return charcthersListWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget charcthersListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.withOpacity(0.7),
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: allCharcthers.length,
                itemBuilder: (ctx, index) {
                  return CharctherItem(
                    currentCharModel: allCharcthers[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
