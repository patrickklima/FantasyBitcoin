import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';

const mapStateToProps = (state) => {
  return {};
};

const mapDispatchToProps = (dispatch) => {
  return {};
};

class CoinIndexContainer extends Component {

  render() {
    return (
      <div>
        <h2>CoinIndexContainer</h2>
      </div>
    );
  }
}

CoinIndexContainer.propTypes = {

};

export default connect(mapStateToProps, mapDispatchToProps)(CoinIndexContainer);


