import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

final initalLoadinProvider = Provider<bool>((ref) {
  //*Traemos todos los provieders que contienen la información de nuestra api
  //
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(nowPopulargMoviesProvider).isEmpty;
  final step3 = ref.watch(nowUpcoming).isEmpty;
  final step4 = ref.watch(nowToprate).isEmpty;

  if (step1 || step2 || step3 || step4) return true; 

  return false; //* terminamos de cargar la información
});
