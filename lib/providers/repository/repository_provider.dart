import 'dart:async';

import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class RepositoryProvider extends BaseDataProvider<RepositoryModel> {
  RepositoryProvider(this.url);
  String url;

  @override
  Future<RepositoryModel> setInitData({bool isInitialisation = false}) {
    return RepositoryServices.fetchRepository(url);
  }
}

class Kitchen {
  Future<bool> cook() async {
    // Interacts with utensil and appliances objects which you
    // don't want to happen during tests.

    await Future.delayed(Duration(hours: 2));

    return true;
  }
}

class Person {
  Future<bool> sleep() async {
    // Waits for 8 hours which you don't want to happen during tests.
    await Future.delayed(Duration(hours: 8));
    return true;
  }

  Future<bool> eat() async {
    // Waits for 2 hours which you don't want to happen during tests.
    await Future.delayed(Duration(hours: 1));
    return true;
  }
}

class Bedroom {
  Bedroom({required this.occupant});
  final Person occupant;
  Future<bool> whenNight() async {
    return occupant.sleep();
  }
}

class House {
  House({required this.owner});
  final Kitchen kitchen = Kitchen();
  late final Bedroom mainBedroom = Bedroom(occupant: owner);
  final Person owner;

  Future<bool> whenEvening() async {
    await kitchen.cook();
    await owner.eat();
    await mainBedroom.whenNight();
    return true;
  }
}

@GenerateM([])
void main() {}
