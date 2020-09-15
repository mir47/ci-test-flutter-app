# Android

## App Signing
App needs a digital signature to publish on the Play Store.

### Create a keystore on Windows
Find the java `keytool`. The `keytool` command might not be in your path—it’s part of Java, which is installed as part of Android Studio. For the concrete path, run `flutter doctor -v` and locate the path printed after ‘Java binary at:’. Then use that fully qualified path replacing `java` (at the end) with `keytool`. Typically it will be under `C:\Program Files\Android\Android Studio\jre\bin\`

Run this command:
```
keytool -genkey -v -keystore C:\Users\{USER_NAME}\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
```
Replace {USER_NAME} with your user name.
This will store the key.jks file in the user home directory.

> :warning: **Keep the keystore file private:** Don’t check it into public source control!
> :warning: **The same keystore must be used for uploading app updates:** Make a backup of the keystore file e.g. email it to yourself

### Reference the keystore from the app
Create a file named `<app dir>/android/key.properties` that contains a reference to your keystore:
```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=<location of the key store file, such as /Users/<user name>/key.jks>
```

### Configure build
(Todo)

### Build release
Run
```
flutter build apk
```
