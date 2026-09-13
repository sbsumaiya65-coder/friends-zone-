    defaultConfig {
        applicationId = "com.example.friends_zone"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutterVersionCode.toInteger()
        versionName = flutterVersionName

        ndk {
            abiFilters.addAll(setOf("armeabi-v7a", "arm64-v8a"))
        }
    }
