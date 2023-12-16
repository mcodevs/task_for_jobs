import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_job/ui/pages/change_location/widgets/custom_elevated_button.dart';
import 'package:task_for_job/ui/pages/ways/bloc/ways_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class WaysPage extends StatefulWidget {
  const WaysPage({super.key});

  @override
  State<WaysPage> createState() => _WaysPageState();
}

class _WaysPageState extends State<WaysPage> {
  late final WaysBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = WaysBloc(context)..add(const WaysEvent.getDirections());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WaysBloc>.value(
      value: _bloc,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<WaysBloc, WaysState>(
              builder: (context, state) {
                return YandexMap(
                  mapObjects: state.maybeMap(
                    orElse: () => [],
                    loading: (value) {
                      print(value.objects);
                      return value.objects;
                    },
                    success: (value) => value.objects,
                  ),
                );
              },
            ),
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: BlocBuilder<WaysBloc, WaysState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    childText: state.map(
                      initial: (value) => "Yo'nalish aniqlanmoqda...",
                      loading: (value) => "Mavjud yo'llar qidirilmoqda...",
                      success: (value) => "Kettik",
                      error: (value) => "Xatolik mavjud. Qayta urining!",
                    ),
                    onPressed: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
