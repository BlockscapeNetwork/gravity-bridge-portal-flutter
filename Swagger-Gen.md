# Swagger Code Gen

Ther are a few steps we have to do to create our code from swagger. Mor information about the swagger code generation can be found at: https://pub.dev/packages/swagger_dart_code_generator

## Configuration

You can add and change configurations for code generation in the build.yaml file in the root directory. Normally this shouldn't be necessary.

## Generate Code

In pubspec.yaml:
- change the imported version of build-runner to the one which is commented out. (incompatible versions)
- comment out alan dependency (because of conflicts)
- uncomment all SWAGGER CODE GEN dev dependencies

Then run 
```
flutter pub get
```

Finally run
```
flutter pub run build_runner build
```

No we only need to clean up.

## Clean Up
Revert all the changes to the pubspec.yaml and again run:
```
flutter pub get
```