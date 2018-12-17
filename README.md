# productivity

productivity is a small app that does some basic algebra:

> `total time = assigned time + extra time`

> `productivity = total time / rate`

## Setup

* `yarn` - See [here](https://yarnpkg.com/en/docs/install) for installation instructions.

    ```
    # Install yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn

    # Make sure it worked
    yarn --version
    ```

* `expo`

    ```
    yarn global add expo-cli
    ```

## Development

* `yarn start` - To start the expo server and connect with a device
* `yarn test` - To run the tests
