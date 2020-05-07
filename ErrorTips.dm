# Flutter で訳わからんビルドエラーになった時にやること

1. `flutter clean` ← ターミナル or  Tool > Flutter > Flutter clean
2. `flutter doctor -v`
3. `build` フォルダを消す
4. 

# device が検知されない

1. `flutter clean`
2. `flutter devices`
3. Android Studio 再起動
4. Mac 再起動


# iOS

- とりあえず `rm -rf ~/Library/Developer/Xcode/DerivedData`
  - .zshrc とかに書いとくと便利 → alias clean='rm -rf ~/Library/Developer/Xcode/DerivedData'

- pods 関係で死んでそうな時
  - `cd ios` → `pod deintegrate` → `pod install`

- どうにもならん時　（https://github.com/flutter/flutter/issues/41900)
  - 'flutter clean && rm ios/Podfile ios/Podfile.lock pubspec.lock && rm -rf ios/Pods ios/Runner.xcworkspace && flutter run'

```
flutter clean && \
rm ios/Podfile ios/Podfile.lock pubspec.lock && \
rm -rf ios/Pods ios/Runner.xcworkspace && \ 
flutter run
```




# Android


- [Android Studioでビルドエラーが解決できない時に試すこと - Qiita](https://qiita.com/ikemura23/items/28cc9e30029200ee3b92)
- [Android 開発でおかしなときはローカルビルドキャッシュの削除も忘れずに - Naohiro Oogatta - Medium](https://medium.com/@oogatta/android-%E9%96%8B%E7%99%BA%E3%81%A7%E3%81%8A%E3%81%8B%E3%81%97%E3%81%AA%E3%81%A8%E3%81%8D%E3%81%AF%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E3%83%93%E3%83%AB%E3%83%89%E3%82%AD%E3%83%A3%E3%83%83%E3%82%B7%E3%83%A5%E3%81%AE%E5%89%8A%E9%99%A4%E3%82%82%E5%BF%98%E3%82%8C%E3%81%9A%E3%81%AB-c6ed1b0d4fd3)

1. `Build > Rebuild Project or Clean Project `
2. `File > Invalidate Caches / Restart`
3. `./gradlew clean cleanBuildCache`
4. `./gradlew --stop`
5. ログで確認できるようにする `./gradlew assembleDebug --info` 



- [App名の変更 android - How to change package name in flutter? - Stack Overflow](https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter)

- Android のパスが通らない時に .zshrc に書いた

```
# android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```