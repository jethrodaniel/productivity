# productivity

productivity is a small app that does some basic algebra:

> `total time = assigned time + extra time`

> `rate = assigned time / total time`

# Installation

To install the app, you're gonna need [Expo](https://expo.io/). Download it for [Android](http://bit.ly/2bZq5ew) or [iOS](http://apple.co/2c6HMtp).

Then click [here](https://expo.io/--/to-exp/exp%3A%2F%2Fexp.host%2F%40jethrodaniel%2Fproductivity) to open in Expo.

## Development

### Setup

* `yarn` - [Installation instructions](https://yarnpkg.com/en/docs/install)

    ```
    # Install yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get -y install yarn

    # Make sure it worked
    yarn --version  #=> 1.12.3
    ```

* `expo`

    ```
    yarn global add expo-cli
    ```

Then `yarn install` and you're done.

### Usage

* `yarn start` - To start the expo server and connect with a device
* `yarn test` - To run the tests
