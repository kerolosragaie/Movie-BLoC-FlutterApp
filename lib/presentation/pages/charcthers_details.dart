import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_flutter/business_logic/cubit/quotes_cubit.dart';
import 'package:movie_bloc_flutter/constants/colors.dart';
import 'package:movie_bloc_flutter/data/models/charcthers_model.dart';
import 'package:movie_bloc_flutter/presentation/widgets/widgets.dart';

class CharcthersDetailsPage extends StatelessWidget {
  final CharcthersModel currentCharcther;
  const CharcthersDetailsPage({Key? key, required this.currentCharcther})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuotesCubit>(context).getAllQuotes("Jesse Pinkman");
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.6),
      body: CustomScrollView(
        slivers: [
          _SliverAppBar(
            currentCharcther: currentCharcther,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataInfo(
                        title: "Actor/Actress: ",
                        value: currentCharcther.name,
                      ),
                      DividerPro(
                        endIndent: 250,
                      ),
                      DataInfo(
                        title: "Job: ",
                        value: currentCharcther.jobs.join(" / "),
                      ),
                      DividerPro(
                        endIndent: 330,
                      ),
                      DataInfo(
                        title: "Appeared in: ",
                        value: currentCharcther.categoryForTwoSeries,
                      ),
                      DividerPro(
                        endIndent: 260,
                      ),
                      DataInfo(
                        title: "Seaons: ",
                        value: currentCharcther.appearanceOfSeasons.join(" / "),
                      ),
                      DividerPro(
                        endIndent: 300,
                      ),
                      DataInfo(
                        title: "Status: ",
                        value: currentCharcther.statusIfDeadOrAlive,
                      ),
                      DividerPro(
                        endIndent: 310,
                      ),
                      currentCharcther.betterCallSaulAppearance.isEmpty
                          ? SizedBox.shrink()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DataInfo(
                                  title: "Better call saul appearance: ",
                                  value: currentCharcther
                                      .betterCallSaulAppearance
                                      .join(" / "),
                                ),
                                DividerPro(
                                  endIndent: 310,
                                ),
                              ],
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: BlocBuilder<QuotesCubit, QuotesState>(
                            builder: (ctxt, state) {
                          if (state is QuotesLoaded) {
                            if ((state).quotes.length != 0) {
                              int randomIndex =
                                  Random().nextInt((state).quotes.length - 1);
                              return SizedBox(
                                width: double.infinity,
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 26.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        '${(state).quotes[randomIndex].quote}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          } else {
                            return Center(
                              child: Image(
                                height: 140,
                                width: 180,
                                fit: BoxFit.fill,
                                image: AssetImage("assets/loading3.gif"),
                              ),
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 450,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//for charcther image and nick name:
class _SliverAppBar extends StatelessWidget {
  final CharcthersModel currentCharcther;
  const _SliverAppBar({Key? key, required this.currentCharcther})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.secondary,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          currentCharcther.nickName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        background: Hero(
          tag: currentCharcther.charId,
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(currentCharcther.image),
          ),
        ),
      ),
    );
  }
}
