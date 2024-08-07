part of 'ref.dart';

@freezed
class MyState with _$MyState {
  const MyState._();

  factory MyState({
    required List<MyModel> myModelList,
    required bool isLoading,
    required bool isConnected,
  }) = _MyState;

  factory MyState.empty() => MyState(
        myModelList: [],
        isLoading: false,
        isConnected: false,
      );
}
