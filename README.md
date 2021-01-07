<p align="center">
  <img src="https://github.com/Lon03/SocialAnimalHelper/blob/main/screenshots/logos.svg" alt="AnimalHelper logo" height="80" >
</p>

<h2 align="center">
    App for finding missing animals
</h2>

## Content
- [Screenshots](#screenshots)
- [Building and Running](#building-and-running)
- [Documentation](#documentation)
- [Debugging](#debugging)
- [Fastlane](#fastlane)
- [License](#license)

## Screenshots

<img alt="1" src="https://github.com/Lon03/SocialAnimalHelper/blob/main/screenshots/1.png?raw=true" width="280">&nbsp;
<img alt="2" src="https://github.com/Lon03/SocialAnimalHelper/blob/main/screenshots/2.png?raw=true" width="280">&nbsp;
<img alt="3" src="https://github.com/Lon03/SocialAnimalHelper/blob/main/screenshots/3.png?raw=true" width="280">&nbsp;

<img alt="4" src="https://github.com/Lon03/SocialAnimalHelper/blob/main/screenshots/4.png?raw=true" width="280">&nbsp;

## Building and Running

You'll need a few things before we get started. 
Make sure you have Xcode installed from the App Store. 
Then run the following command to install Xcode's command line tools, if you don't have that yet
```sh
xcode-select --install
```

Install [`Bundler`](https://bundler.io) for managing Ruby gem dependencies
```sh
[sudo] gem install bundler
```

Install [Brew](https://github.com/Homebrew/brew) package manager for macOS:

For MacOS Catalina, macOS Mojave, and MacOS Big Sur:
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

For macOS High Sierra, Sierra, El Capitan, and earlier:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Install [`Node`](https://nodejs.org/en/) (required to install [Apollo](https://github.com/apollographql/apollo-ios))
```sh
brew install node
```

The following commands will set up SwiftHub
```sh
cd AnimalHelper
bundle install
bundle exec fastlane setup
```

To update all tools and pods
```sh
bundle exec fastlane update
```

Alrighty! We're ready to go!

## Documentation
You can generate the API docs locally. Run `jazzy` from the root of this repository. This requires installation of [jazzy](https://github.com/realm/jazzy/). You will find the output in `docs/`. You can set options for your project’s documentation in a configuration file, [.jazzy.yaml](https://github.com/Lon03/SocialAnimalHelper/blob/main/.jazzy.yaml) by default.

## Debugging
[Flex](https://github.com/Flipboard/FLEX) debugging tool has been integrated in this application. To enable it, just swipe right anywhere in the application.
There are also included debugging [Hero](https://github.com/HeroTransitions/Hero) animations. To use it, swipe right with two fingers. Repeat this to disable.

## Fastlane

[Fastlane](https://fastlane.tools) automates common development tasks - for example bumping version numbers, running tests on multiple configurations, or submitting to the App Store. You can list the available lanes (our project-specific scripts) using `bundle exec fastlane lanes`. You can list available actions (all actions available to be scripted via lanes) using `bundle exec fastlane actions`. The fastlane configuration and scripts are in the `fastlane` folder.

## License
MIT License. See [LICENSE]().

