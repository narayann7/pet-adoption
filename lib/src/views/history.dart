import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adoption_app/src/utils/common_function.dart';
import 'package:pet_adoption_app/src/views/common.dart';
import 'package:pet_adoption_app/src/views/details.dart';

import '../controllers/pets_cubit/pets_cubit.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);
  static const String routeName = '/historyView';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/historyView"),
        builder: (c) {
          return const HistoryView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsCubit, PetsState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: const CustomAppBar(),
            body: state.adoptedPets.isEmpty
                ? Center(
                    child: CustomText(
                    "No History Found",
                    style: Theme.of(context).textTheme.headline6,
                  ))
                : ListView.builder(
                    itemCount: state.adoptedPets.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          moveToNextScreenWithArguments(
                              context,
                              PetDetailsView.routeName,
                              state.adoptedPets[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          padding: const EdgeInsets.all(20),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Hero(
                                tag: state.adoptedPets[index].image.toString(),
                                child: Container(
                                    height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "lib/assets/images/${state.adoptedPets[index].image}"),
                                            fit: BoxFit.cover))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${state.adoptedPets[index].name}",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Adopted",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              //Detelte Button
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<PetsCubit>()
                                      .removePetFromHistory(
                                          state.adoptedPets[index]);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Icon(
                                    LineIcons.trash,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ) // Cente
            );
      },
    );
  }
}
