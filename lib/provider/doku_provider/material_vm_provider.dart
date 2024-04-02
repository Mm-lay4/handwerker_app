import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handwerker_app/constants/api/url.dart';
import 'package:handwerker_app/models/consumable_models/material_vm/material_vm.dart';

final materialVMProvider =
    AsyncNotifierProvider<MaterialNotifier, List<MaterialVM>>(() => MaterialNotifier());

class MaterialNotifier extends AsyncNotifier<List<MaterialVM>> {
  @override
  List<MaterialVM> build() => [];

  void loadMaterials() async {
    final materialUri = const DbAdresses().getMaterialsList;
    final Dio dio = Dio();
    try {
      final response = await dio.get(materialUri);
      if (response.statusCode != 200) {
        log('request is not successed -> ${response.data}');
        return;
      }
      final List data = response.data.map((e) => e as Map).toList();
      final materials = data.map((e) => MaterialVM.fromJson(e)).toList();
      log("$materials");
      state = AsyncValue.data(materials);
      return;
    } catch (e) {
      log('request was incompleted this was the error: $e');
    }
  }
}