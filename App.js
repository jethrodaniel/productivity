// import { AppLoading } from 'expo';
// import { Asset } from 'expo-asset';
// import * as Font from 'expo-font';
// import React, { useState } from 'react';
// import { Platform, StatusBar, StyleSheet, View } from 'react-native';
// import { Ionicons } from '@expo/vector-icons';

// import AppNavigator from './navigation/AppNavigator';

// export default function App(props) {
//   const [isLoadingComplete, setLoadingComplete] = useState(false);

//   if (!isLoadingComplete && !props.skipLoadingScreen) {
//     return (
//       <AppLoading
//         startAsync={loadResourcesAsync}
//         onError={handleLoadingError}
//         onFinish={() => handleFinishLoading(setLoadingComplete)}
//       />
//     );
//   } else {
//     return (
//       <View style={styles.container}>
//         {Platform.OS === 'ios' && <StatusBar barStyle="default" />}
//         <AppNavigator />
//       </View>
//     );
//   }
// }

// async function loadResourcesAsync() {
//   await Promise.all([
//     Asset.loadAsync([
//       require('./assets/images/robot-dev.png'),
//       require('./assets/images/robot-prod.png'),
//     ]),
//     Font.loadAsync({
//       // This is the font that we are using for our tab bar
//       ...Ionicons.font,
//       // We include SpaceMono because we use it in HomeScreen.js. Feel free to
//       // remove this if you are not using it in your app
//       'space-mono': require('./assets/fonts/SpaceMono-Regular.ttf'),
//     }),
//   ]);
// }

// function handleLoadingError(error) {
//   // In this case, you might want to report the error to your error reporting
//   // service, for example Sentry
//   console.warn(error);
// }

// function handleFinishLoading(setLoadingComplete) {
//   setLoadingComplete(true);
// }

// const styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     backgroundColor: '#fff',
//   },
// });


import React from 'react';

import { Alert, StyleSheet } from 'react-native';

import Header from './components/Header';
import NumberInput from './components/NumberInput';
import InputPage from './components/InputPage';
import ResultPage from './components/ResultPage';

// Top-most component
export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { submitted: false };
  }

  // Logs a button press to the console
  logPress = () => {
    console.log(`
      Pressed a button! submitted: ${this.state.submitted}

      hours: ${this.state.hours}
      minutes: ${this.state.minutes}
      rate: ${this.state.rate}
    `);
  }

  // Submits the input page
  submit = () => {
    this.logPress();

    valid = [
      this.state.hours,
      this.state.minutes,
      this.state.rate
    ].every((n) => n >= 0)

    if (valid)
      this.setState({submitted: true});
    else
      Alert.alert('Fill out all fields first.');
  }

  // Returns to the input page
  goBack = () => {
    this.logPress();
    this.setState({
      submitted: false,
      hours: null,
      minutes: null,
      rate: null
    });
  }

  render() {
    if (!this.state.submitted) {
      return (
        <InputPage
          styles={styles}
          submitHours={(hours) => this.setState({hours})}
          submitMinutes={(minutes) => this.setState({minutes})}
          submitRate={(rate) => this.setState({rate})}
          onPress={this.submit}
        />
      );
    } else {
      return (
        <ResultPage
          styles={styles}
          onPress={this.goBack}
          hours={this.state.hours}
          minutes={this.state.minutes}
          rate={this.state.rate}
        />
      );
    }
  }
}

const styles = StyleSheet.create({
  app: {
    alignItems: 'center',
    backgroundColor: '#282923',
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-around',
    paddingTop: 10
  },
  button: {
    color: '#841584'
  }
});
