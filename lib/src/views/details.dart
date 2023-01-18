import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/utils/constants.dart';
import 'package:pet_adoption_app/src/views/common.dart';

class PetDetailsView extends StatelessWidget {
  const PetDetailsView({Key? key}) : super(key: key);
  static const String routeName = '/petDetailsView';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/petDetailsView"),
        builder: (c) {
          return const PetDetailsView();
        });
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
                      height: MediaQuery.of(context).size.height * 0.6,
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
                  // shape: BoxShape.circle,
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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.18),
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: const Offset(0, 0))
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          CustomText("Pet Name", fontSize: 20),
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
                          fontSize: 15, type: FontStyle.subtitle),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    )
                  ],
                )),
          ),
          // )
        ],
      ),
    );
  }
}
