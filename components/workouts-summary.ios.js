const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
import ListHeader from './list-header';
const Colors = require('../colors.json');

const WorkoutsSummary = React.createClass({
  render() {
    const totalSeconds = this.props.data.reduce(((sum, workout) => sum + workout.duration), 0);
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds - hours * 3600) / 60);
    return (
      <ListHeader>
        <View style={styles.container}>
          <View style={styles.infoContainer}>
            <Text style={styles.value}>
              {hours}h {minutes}m
            </Text>
            <Text style={styles.label}>
              Gym time this week
            </Text>
          </View>
          <View style={styles.infoContainer}>
            <Text style={styles.value}>
              +1.0 lb
            </Text>
            <Text style={styles.label}>
              Gain this week
            </Text>
          </View>
        </View>
      </ListHeader>
    )
  }
});

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
  },
  infoContainer: {
    flex: 1,
  },
  label: {
    color: Colors.darkGrey,
    fontSize: 13,
    textAlign: 'center'
  },
  value: {
    fontSize: 24,
    fontWeight: '100',
    marginBottom: 6,
    textAlign: 'center'
  }
});

export default WorkoutsSummary;