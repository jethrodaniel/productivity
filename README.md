# productivity

![](https://github.com/jethrodaniel/productivity/workflows/build/badge.svg)

productivity is a small app that does some basic algebra:

> I'm supposed to spend r% of my time doing so and so out of the total time.

> If I'm assigned x hours and y minutes of so and so, what will be my total time?

```
assigned_time   = 5 hours and 3 minutes
rate            = 0.8
# assigned_time = total_time * 0.8
total_time      = assigned_time / rate # => 5 hours, 37 minutes
```

# Installation

To install the app, you're gonna need [Expo](https://expo.io/). Download it for [Android](http://bit.ly/2bZq5ew) or [iOS](http://apple.co/2c6HMtp).

Available [here](https://expo.io/@jethrodaniel/productivity).

## Development

### Setup

```
#-- yarn ----------------------------------------------------
#
# See https://yarnpkg.com/en/docs/install

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get -y install yarn

# Make sure it worked
yarn --version  #=> 1.17.4

#-- expo ----------------------------------------------------
yarn global add expo-cli

#-- install dependencies ------------------------------------
yarn install
```

### Usage

```
#-- start the app locally -----------------------------------
yarn start

#-- run the tests -------------------------------------------
yarn test
```

### LICENSE

MIT, of course.
