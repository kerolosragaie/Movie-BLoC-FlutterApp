import 'package:flutter/material.dart';
import 'package:movie_bloc_flutter/constants/colors.dart';
import 'package:movie_bloc_flutter/data/models/charcthers_model.dart';

class CharctherItem extends StatelessWidget {
  final CharcthersModel currentCharModel;
  const CharctherItem({Key? key, required this.currentCharModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: AppColors.main, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        child: Container(
            color: Colors.white,
            child: currentCharModel.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: "assets/loading.gif",
                    fit: BoxFit.fill,
                    image: currentCharModel.image)
                : Image.asset(
                    "assets/error.gif",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  )),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black45,
          alignment: Alignment.bottomCenter,
          child: Text(
            currentCharModel.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                height: 1.3,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
