import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:movie_bloc_flutter/business_logic/cubit/charcthers_cubit.dart';
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
  List<CharcthersModel> searchedCharcthers = [];
  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<CharcthersCubit>(context).getAllCharcthers();
    });
  }

  //Search functinoallty:
  void _addSearchedForItemsToSearchList(String searchedCharcther) {
    searchedCharcthers = allCharcthers
        .where((charcther) =>
            charcther.name.toLowerCase().contains(searchedCharcther))
        .toList();
    setState(() {});
  }

  //To start searching:
  void _startSearching() {
    //!Entering new route in same page:
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  //To stop searching:
  void _stopSearching() {
    setState(() {
      _searchTextController.clear();
      _isSearching = false;
    });
    //!Leaving the route
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        //?controlling the color of default back button
        leading: _isSearching
            ? BackButton(
                color: Colors.white,
                onPressed: _stopSearching,
              )
            : const SizedBox.shrink(),
        title: _isSearching
            ? SearchTextField(
                textEditingController: _searchTextController,
                onChanged: (val) {
                  _addSearchedForItemsToSearchList(val);
                },
              )
            : Text(
                "Charcters".toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
        actions: _searchAppBarActions(),
      ),
      body: OfflineBuilder(
        child: Text("Loading..."),
        connectivityBuilder: (cntxt, connectivity, child) {
          final bool isConnected = connectivity != ConnectivityResult.none;
          if (isConnected) {
            return BlocBuilder<CharcthersCubit, CharcthersCubitState>(
              builder: (context, state) {
                if (state is CharcthersLoaded) {
                  allCharcthers = (state).charcthers;
                  return charcthersListWidget();
                } else {
                  return const Center(
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/loading2.gif"),
                    ),
                  );
                }
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/error.gif"),
                  ),
                  Text(
                    "Check your connection and try again.",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      /* body: BlocBuilder<CharcthersCubit, CharcthersCubitState>(
        builder: (context, state) {
          if (state is CharcthersLoaded) {
            allCharcthers = (state).charcthers;
            //return charcthersListWidget();
            return OfflineBuilder(
              child: Text("Loading..."),
              connectivityBuilder: (BuildContext cntxt,
                  ConnectivityResult connectivity, Widget child) {
                final bool isConnected =
                    connectivity != ConnectivityResult.none;
                if (isConnected) {
                  return charcthersListWidget();
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/error.gif"),
                        ),
                        Text(
                          "Check your connection and try again.",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/loading2.gif"),
              ),
            );
          }
        },
      ), */
    );
  }

  //A gridview contains Charcthers Model
  Widget charcthersListWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _isSearching &&
                  searchedCharcthers.length <= 0 &&
                  _searchTextController.text.isNotEmpty
              ? Center(
                  child: Image(
                    image: AssetImage("assets/not_found.gif"),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: _searchTextController.text.isEmpty
                      ? allCharcthers.length
                      : searchedCharcthers.length,
                  itemBuilder: (ctx, index) {
                    return CharctherItem(
                      currentCharModel: _searchTextController.text.isEmpty
                          ? allCharcthers[index]
                          : searchedCharcthers[index],
                    );
                  }),
        ],
      ),
    );
  }

  //App bar with search widget:
  List<Widget> _searchAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: _stopSearching,
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearching,
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
      ];
    }
  }
}
