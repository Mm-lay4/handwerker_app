import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handwerker_app/constants/api/api.dart';
import 'package:handwerker_app/models/service_models/service_list_vm/service_list.dart';
import 'package:handwerker_app/provider/settings_provider/user_provider.dart';

final serviceProvider =
    AsyncNotifierProvider<ServiceNotifer, List<ServiceListVM>?>(
        () => ServiceNotifer());

class ServiceNotifer extends AsyncNotifier<List<ServiceListVM>?> {
  final Api api = Api();
  @override
  List<ServiceListVM>? build() {
    return null;
  }

  void loadServices() async {
    // final uri = DbAdresses().getExecuteableServices;
    // final Dio http = Dio();
    try {
      // final response = await http.get(uri);
      final response = await api.getExecuteableServices;
      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          ref.read(userProvider.notifier).userLogOut();
          return;
        }
        log('Request not completed: ${response.statusCode} Backend returned : ${response.data}  \n as Message');
        return;
      }
      final data = response.data;
      final services =
          data.map<ServiceListVM>((e) => ServiceListVM.fromJson(e)).toList();
      state = AsyncValue.data(services);
    } catch (e) {
      throw Exception(e);
    }
  }
}
