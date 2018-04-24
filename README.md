# gradle-wrapper-delegator
A pseudo gradle installation that delegates to the gradle wrapper

## Motivation

The Gradle build system comes with a handy tool called the [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:upgrading_wrapper). The general consensus is that you should use the wrapper whenever you can. If you work on multiple projects, each of them brings its own gradle wrapper. In addition, on your workstation you're likely to have at least one version of Gradle installed (manually, through SDKMAN, the OS's package manager, whatever).

When executing a Gradle build, you can chose whether to use the Gradle binary installed on your system (reachable through your PATH) or the project's gradle wrapper by calling either `gradle` or `./gradlew` respectively.

If you're like me, you got used to using the `gradle` command all the time, and you forget to use the more cumbersome `./gradlew`. That's relatively fine as long as the version of the installed Gradle distribution and that of the project's wrapper don't differ too much. If they do, however, you might end up in weird "works-on-my-machine" type situations again, which is exactly what the wrapper meant to avoid in the first place.

## Usage

**gradle-wrapper-delegator to the rescue!** It is meant as a drop-in replacement for the installed form of Gradle and simply delegates everything to `./gradlew`. It even searches the `./gradlew` wrapper script up the current working directory, so you can call it from anywhere within a gradle-wrapper-enabled project.

E.g. a command like this:

    C:\myproject\subproject> gradle build --refresh-dependencies

could end up executing this:

    C:\myproject\subproject> "C:\myproject\gradlew.bat" build --refresh-dependencies

To use it, unpack it somewhere and make sure the `gradle-wrapper-delegator/bin` directory is in your PATH before the real Gradle installation.
