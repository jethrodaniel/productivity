import React from 'react';
const e = React.createElement;

import { Text, StyleSheet, View } from 'react-native';

export default class Header extends React.Component {
  render() {
    return (
      e(View, {},
        e(Text, {style: styles.header}, this.props.msg)
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
