import 'package:flutter/material.dart';
import 'package:task_for_job/common/config/route.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';
import 'package:task_for_job/ui/pages/change_location/widgets/custom_elevated_button.dart';
import 'package:task_for_job/ui/pages/home/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeCubit _cubit;

  String current = "";

  @override
  void initState() {
    super.initState();
    _cubit = HomeCubit();
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: StreamBuilder<HomeState>(
              stream: _cubit.stream,
              initialData: _cubit.state,
              builder: (context, snapshot) {
                final data = snapshot.data!;
                return Column(
                  children: [
                    const Spacer(),
                    CustomElevatedButton(
                      childText: data.first?.address ?? HomeCubit.from,
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      onPressed: () async {
                        current = HomeCubit.from;
                        final model = await Navigator.pushNamed(
                            context, AppRoutes.savedLocations);
                        if (model != null && model is MapModel) {
                          _cubit.changeFirst(model);
                        }
                      },
                    ),
                    const SizedBox.square(
                      dimension: 60,
                      child: Center(
                        child: Icon(
                          Icons.arrow_downward,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      childText: data.second?.address ?? HomeCubit.to,
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      onPressed: () async {
                        current = HomeCubit.to;
                        final model = await Navigator.pushNamed(
                            context, AppRoutes.savedLocations);
                        if (model != null && model is MapModel) {
                          _cubit.changeSecond(model);
                        }
                      },
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                      childText: "Yo'nalishni ko'rish",
                      onPressed: () {
                        if (data.first?.address != null &&
                            data.second?.address != null) {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.ways,
                            arguments: {
                              'first': data.first,
                              'second': data.second,
                            },
                          );
                        }
                      },
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
