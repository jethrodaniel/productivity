import React from 'react';

import { Text, StyleSheet, View } from 'react-native';

export default class Header extends React.Component {
  render() {
    return (
      <View>
        <Text style={styles.header}>
          {this.props.msg}
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  header: {
    color: 'white',
    fontSize: 32
  }
});

