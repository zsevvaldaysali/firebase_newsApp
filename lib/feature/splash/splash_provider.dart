// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_news/product/enums/platfor_enum.dart';
import 'package:flutter_firebase_news/product/models/number_model.dart';
import 'package:flutter_firebase_news/product/utility/firebase/firebase_collections.dart';
import 'package:flutter_firebase_news/product/utility/version_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();

    if(databaseValue == null || databaseValue.isEmpty){
      state = state.copyWith(isRedirectHome: false);
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(deviceValue: clientVersion, databaseValue: databaseValue);

    if(checkIsNeedForceUpdate.isNeedUpdate() ){
          state = state.copyWith(isRequiredForcedUpdate: true);
          return;
    }
              state = state.copyWith(isRedirectHome: true);

  }

  //eğer platform web ise, webde forceUpdate yapmamıza gerek yok çünkü webde güncelleme olduğu zaman doğrudan siteyi gnücelleyip ekrarna atabiliriz
  Future<String?> getVersionNumberFromDatabase() async{
    if (kIsWeb) return null;
    final response = await FirebaseCollections.version.reference
        .withConverter<NumberModel>(
            fromFirestore: (snapshot, options) => NumberModel().fromFirebase(snapshot),
            toFirestore: (value, option) => value.toJson(),
            )
        .doc(PlatformEnums.versionName).get();
    return response.data()?.number;
  }
}

class SplashState extends Equatable {
  const SplashState({
    this.isRequiredForcedUpdate,
    this.isRedirectHome,
  });

  final bool? isRequiredForcedUpdate;
  final bool? isRedirectHome;
  @override
  // TODO: implement props
  List<Object?> get props => [isRequiredForcedUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForcedUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForcedUpdate: isRequiredForcedUpdate ?? this.isRequiredForcedUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
