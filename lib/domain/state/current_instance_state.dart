import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tankobon/domain/database/current_instance.dart";
import "package:tankobon/domain/database/instances.dart";

part "current_instance_state.g.dart";

@riverpod
class CurrentInstanceState extends _$CurrentInstanceState {
  @override
  String? build() => null;

  Future<void> init(WidgetRef ref) async {
    final instanceList = await getInstanceList();

    if (instanceList.isNotEmpty) {
      state = await getCurrentInstance();
    }

    ref.read(instanceInitStateProvider.notifier).init();
  }
}

@riverpod
class InstanceInitState extends _$InstanceInitState {
  @override
  bool build() => false;

  void init() {
    state = true;
  }
}
