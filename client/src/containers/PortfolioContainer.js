import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';

const mapStateToProps = (state) => {
  return {};
};

const mapDispatchToProps = (dispatch) => {
  return {};
};

class PortfolioContainer extends Component {

  render() {
    return (
      <div>
        <h2>PortfolioContainer</h2>
      </div>
    );
  }
}

PortfolioContainer.propTypes = {

};

export default connect(mapStateToProps, mapDispatchToProps)(PortfolioContainer);


