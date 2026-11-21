import 'package:studio_core/core/arcade.dart';
import 'package:studio_core/core/level_plan.dart';
import 'package:studio_core/core/missions.dart';
import 'package:studio_core/core/stats.dart';
import 'tycoon_engine.dart';

/// Rules shared by the management games: level = calibrated scenario.
class TycoonRules extends ArcadeRules<TycoonLevel> {
  final TycoonSpec spec;
  final String id;
  final List<GameStat> stats;
  final List<MissionTemplate> missions;

  TycoonRules(this.spec, this.id, this.stats, this.missions);

  @override
  String get gameId => id;

  @override
  List<String> get optionalMechanics => tycoonMechanics;

  @override
  List<GameStat> get gameStats => stats;

  @override
  List<MissionTemplate> get missionTemplates => missions;

  @override
  TycoonLevel generate(LevelSpec spec) => generateTycoonLevel(this.spec, spec);

  @override
  ArcadeMeta metaOf(TycoonLevel l) => l.meta;

  @override
  ArcadeSim createSim(TycoonLevel l) => TycoonSim(l);

  @override
  ArcadeInput bot(ArcadeSim sim) => tycoonBot(sim);

  @override
  int maxTicks(TycoonLevel l) => l.limitSec > 0 ? l.limitSec * kTicksPerSecond : super.maxTicks(l);
}
