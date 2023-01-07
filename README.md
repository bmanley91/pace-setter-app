# Pace Tracker App

## Setup
1. Clone this repo:
    ```
    git clone  git@github.com:bmanley91/pace-tracker-app.git
    ```
1. Install depdencies:
    ```
    flutter pub get
    ```
1. Run tests:
    ```
    flutter test
    ```

## Branching
- Release branches are made off of master with a naming convention of `release-<semver>` (e.g. `release-1.0.4`). 
- Feature branches are made off of and merged into release branches.
- Release branches are merged into master once they are released.

## Building
Before building for a release make sure to update the version in pubspec.yaml to have a unique build number.
```
...
version: <semver>+<build_number>
...
```

### iOS
Build an ipa for iOS App Store distribution with
```
flutter build ipa
```

### Android
Build an app bundle for Google Play Store distribution with
```
flutter build appbundle --build-name <version>
```
