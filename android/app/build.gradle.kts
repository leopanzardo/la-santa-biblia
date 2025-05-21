import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.leopanzardo.biblia"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.leopanzardo.biblia"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val keyProperties = Properties()
            val keyPropertiesFile = rootProject.file("key.properties")

            if (keyPropertiesFile.exists()) {
                keyProperties.load(FileInputStream(keyPropertiesFile))
                val storeFilePath = keyProperties.getProperty("storeFile")
                val storePassword = keyProperties.getProperty("storePassword")
                val keyAlias = keyProperties.getProperty("keyAlias")
                val keyPassword = keyProperties.getProperty("keyPassword")

                println("DEBUG EN signingConfigs: storeFilePath=$storeFilePath, storePassword=$storePassword, keyAlias=$keyAlias, keyPassword=$keyPassword")

                if (storeFilePath == null || storePassword == null || keyAlias == null || keyPassword == null) {
                    throw GradleException("Faltan propiedades en key.properties")
                }

                this.storeFile = file(storeFilePath)
                this.storePassword = storePassword
                this.keyAlias = keyAlias
                this.keyPassword = keyPassword
            } else {
                throw GradleException("Archivo key.properties no encontrado")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            // Optional: enable minification or shrinking in release builds
            // minifyEnabled = true
            // shrinkResources = true
            // proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }

    applicationVariants.all {
        outputs.all {
            val outputImpl = this as com.android.build.gradle.internal.api.BaseVariantOutputImpl
            outputImpl.outputFileName = "la_santa_biblia.apk"
        }
    }
}

flutter {
    source = "../.."
}
