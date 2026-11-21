import 'package:studio_core/core/arcade.dart';
import 'package:studio_core/core/missions.dart';
import 'package:studio_core/core/stats.dart';
import 'pet_spec.dart';
import 'tycoon_rules.dart';

class PetRules extends TycoonRules {
  PetRules()
      : super(petSpec, 'game-045-pet-care-simulator', const [
          GameStat('population_peak', 'Bakılan can dost', 'Pets cared for', scale: 50),
          GameStat('buildings_bought', 'Kurulan alan', 'Areas built', scale: 40),
          GameStat('money_earned', 'Toplanan bağış', 'Donations', scale: 5000),
        ], const [
          MissionTemplate('population_peak', 'population_peak', [16, 33, 50]),
          MissionTemplate('buildings_bought', 'buildings_bought', [13, 26, 40]),
        ]);
}

ArcadeRules createRules() => PetRules();
