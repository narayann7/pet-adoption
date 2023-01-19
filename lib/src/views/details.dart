import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/src/controllers/pets_cubit/pets_cubit.dart';
import 'package:pet_adoption_app/src/models/pet_data_model.dart';
import 'package:pet_adoption_app/src/utils/constants.dart';
import 'package:pet_adoption_app/src/views/common.dart';

class PetDetailsView extends StatefulWidget {
  const PetDetailsView({Key? key, required this.petDataModel})
      : super(key: key);
  static const String routeName = '/petDetailsView';
  final PetDataModel petDataModel;
  static MaterialPageRoute getNavigator(PetDataModel petDataModel) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/petDetailsView"),
        builder: (c) {
          return PetDetailsView(
            petDataModel: petDataModel,
          );
        });
  }

  @override
  State<PetDetailsView> createState() => _PetDetailsViewState();
}

class _PetDetailsViewState extends State<PetDetailsView> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 1));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsCubit, PetsState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Hero(
                        tag: widget.petDataModel.image.toString(),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "lib/assets/images/${widget.petDataModel.image}"),
                                    fit: BoxFit.cover))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            Theme.of(context).backgroundColor.withOpacity(0.7),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              // boxShadow: kElevationToShadow[8],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Theme.of(context).backgroundColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: CustomText(
                                        "${widget.petDataModel.name} (${widget.petDataModel.type})",
                                        fontSize: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 20),
                                      child: CustomText(
                                        "${widget.petDataModel.price}",
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 20,
                                      ),
                                      CustomText(
                                        "${widget.petDataModel.location}",
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color!
                                            .withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    getSmallDetails(
                                        context: context,
                                        details: "${widget.petDataModel.sex}",
                                        title: "Sex"),
                                    getSmallDetails(
                                        context: context,
                                        title: "Age",
                                        details: "${widget.petDataModel.age}"),
                                    getSmallDetails(
                                        context: context,
                                        title: "Breed",
                                        details:
                                            "${widget.petDataModel.breed}"),
                                    getSmallDetails(
                                        context: context,
                                        title: "Weight",
                                        details:
                                            "${widget.petDataModel.weight}")
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: CustomText(
                              "${widget.petDataModel.ownerName}",
                              fontSize: 20,
                            ),
                            subtitle: CustomText("Pet Owner",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .color!
                                    .withOpacity(0.5),
                                fontSize: 15,
                                type: FontStyle.subtitle),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: Color(0xffddedc9)),
                                  child: const Icon(Icons.call,
                                      size: 25, color: Color(0xff2a5406)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: Color(0xffd6d6f7)),
                                  child: const Icon(
                                    Icons.message,
                                    size: 25,
                                    color: Color(0xff0702b0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.petDataModel.isAdopted == false) {
                                context
                                    .read<PetsCubit>()
                                    .addPetToHistory(widget.petDataModel);
                                setState(() {
                                  showAlertDialog(
                                    context,
                                    widget.petDataModel.name.toString(),
                                    _controllerCenterLeft,
                                    _controllerCenterRight,
                                  );
                                  _controllerCenterLeft.play();
                                  _controllerCenterRight.play();
                                });
                              } else {
                                //snakbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Already Adopted",
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: widget.petDataModel.isAdopted == true
                                    ? Colors.grey
                                    : const Color(0xff7C77B9),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(
                                child: CustomText(
                                  "Adopt Me",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),

                // )
              ],
            ));
      },
    );
  }
}
