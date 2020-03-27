import React from "react";

class JoinGame extends React.Component {
  state = { dataKey: null };

  componentDidMount() {
    const { drizzle } = this.props;
    const contract = drizzle.contracts.BlockWord;

    // let drizzle know we want to watch the `roundTimerSecs` method
    const dataKey = contract.methods["roundTimerSecs"].cacheCall();

    // save the `dataKey` to local component state for later reference
    this.setState({ dataKey });
  }

  render() {
    // get the contract state from drizzleState
    const { BlockWord } = this.props.drizzleState.contracts;
    console.log(BlockWord);
    // using the saved `dataKey`, get the variable we're interested in
    const roundTimerSecs = BlockWord.roundTimerSecs.call;
    console.log(roundTimerSecs);
    
    // if it exists, then we display its value
    return <p>Round Timer Seconds: {roundTimerSecs}</p>;
  }
}

export default JoinGame;