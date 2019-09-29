# productivity

![](https://github.com/jethrodaniel/productivity/workflows/build/badge.svg)

productivity is a small android/ios app that does some basic algebra:

> I'm supposed to spend r% of my time doing so and so out of the total time.

> If I'm assigned x hours and y minutes of so and so, what will be my total time?

```
assigned_time   = 5 hours and 3 minutes
rate            = 0.8
# assigned_time = total_time * rate
total_time      = assigned_time / rate # => 5 hours, 37 minutes
```

# Installation

To install the app, you're gonna need [Expo](https://expo.io/). Download it for [Android](http://bit.ly/2bZq5ew) or [iOS](http://apple.co/2c6HMtp).

Once that's installed, download this app [here](https://expo.io/@jethrodaniel/productivity).

## Development

productivity is a typical react-native app that is deployed using the expo platform.

### Setup

#### yarn

See https://yarnpkg.com/en/docs/install

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get -y install yarn

# Make sure it worked
yarn --version  #=> 1.17.4
```

#### expo

See https://docs.expo.io/versions/latest/introduction/installation/

```
yarn global add expo-cli
```

#### Setup this project

```
yarn install
```

### Usage

To start the app locally

```
yarn start
```

To run the tests

```
yarn test
```

### LICENSE

[MIT](LICENSE.txt)
