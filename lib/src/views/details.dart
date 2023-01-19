import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
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
                  tag: "1234",
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                              image: AssetImage("lib/assets/images/dog1.jpg"),
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
                  color: Theme.of(context).backgroundColor.withOpacity(0.7),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                        boxShadow: kElevationToShadow[8],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: CustomText(
                                  "Pet name (Dog)",
                                  fontSize: 30,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 20),
                                child: CustomText(
                                  "\$ 89",
                                  fontSize: 20,
                                ),
                              ),
                            ],
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
                                  "New York",
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              getSmallDetails(
                                  context: context,
                                  details: "Male",
                                  title: "Sex"),
                              getSmallDetails(
                                  context: context, title: "Age", details: "2"),
                              getSmallDetails(
                                  context: context,
                                  title: "Breed",
                                  details: "Persion"),
                              getSmallDetails(
                                  context: context,
                                  title: "Weight",
                                  details: "20kg")
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
                        "Hohn Doe",
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
                        setState(() {
                          showAlertDialog(
                            context,
                            _controllerCenterLeft,
                            _controllerCenterRight,
                          );
                          _controllerCenterLeft.play();
                          _controllerCenterRight.play();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: CustomText(
                            "Adopt Me",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),

          // )
        ],
      ),
    );
  }
}
