import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adoption_app/src/controllers/global_cubit/app_global_cubit.dart';
import 'package:pet_adoption_app/src/controllers/pets_cubit/pets_cubit.dart';
import 'package:pet_adoption_app/src/views/common.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/home';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/home"),
        builder: (c) {
          return BlocProvider(
              create: (context) => PetsCubit(), child: const HomeView());
        });
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> filter = [
    "Breed",
    "Age",
    "Name",
  ];
  String dropdownvalue = 'Breed';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PetsCubit>().getDataFromApi();
    });
    super.initState();
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.233,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  const Icon(LineIcons.search),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Search",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const Spacer(),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: dropdownvalue,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      elevation: 16,
                                      enableFeedback: true,
                                      icon: const Icon(
                                        LineIcons.filter,
                                        size: 22,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      items: filter.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: CustomText(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
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
                              height: 40,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      height: 20,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: CustomText(
                                          "Dog",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 20,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: CustomText(
                                        "Dog",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                      ),
                                    ),
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
                      width: MediaQuery.of(context).size.width,
                      child:
                          // petShimmerCard(context),

                          ListView(
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          // SinglePet(onTap: () {
                          //   moveToNextScreen(context, PetDetailsView.routeName);
                          // }),
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
