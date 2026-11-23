import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_voleybol/oyun_voleybol.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(voleybolConfig.title.length, 33);
    expect(voleybolConfig.tagline.length, 33);
    for (final s in voleybolConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(voleybolRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: voleybolId, optionalMechanics: voleybolRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(voleybolRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
