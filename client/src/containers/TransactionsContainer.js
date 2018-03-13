import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';

const mapStateToProps = (state) => {
  return {};
};

const mapDispatchToProps = (dispatch) => {
  return {};
};

class TransactionsContainer extends Component {

  render() {
    return (
      <div>
        <h2>TransactionsContainer</h2>
      </div>
    );
  }
}

TransactionsContainer.propTypes = {

};

export default connect(mapStateToProps, mapDispatchToProps)(TransactionsContainer);


