import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adoption_app/src/controllers/global_cubit/app_global_cubit.dart';
import 'package:pet_adoption_app/src/utils/common_function.dart';
import 'package:pet_adoption_app/src/views/common.dart';
import 'package:pet_adoption_app/src/views/details.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/home';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/home"),
        builder: (c) {
          return BlocProvider(
              create: (context) => AppGlobalCubit(), child: const HomeView());
        });
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppGlobalCubit, AppGlobalState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: const CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.27,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Find your pet",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: const [
                                  Icon(LineIcons.search),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Search",
                                          border: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              "Pet Categories",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SinglePet(onTap: () {
                            moveToNextScreen(context, PetDetailsView.routeName);
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ) // Cente
            );
      },
    );
  }
}
