import React from 'react';

import { Text, StyleSheet, View } from 'react-native';

export default class Header extends React.Component {
  render() {
    return (
      React.createElement(
        View,
        {},
        React.createElement(
          Text,
          {style: styles.header},
          null
        )
      )
    );
  }
}

const styles = StyleSheet.create({
  header: {
    color: 'white',
    fontSize: 26
  }
});
