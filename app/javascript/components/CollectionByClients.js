import React from "react"
import PropTypes from "prop-types"
class CollectionByClients extends React.Component {
  render () {
    return (
      <React.Fragment>
        <table className='table table-striped'>
          <thead>
            <tr>
              <th>CWB</th>
              <th>Shipper</th>
              <th>Date</th>
              <th>Destination</th>
              <th>Status</th>
              <th>Total</th>
              <th>Balance</th>
              <th>Payment</th>
            </tr>
          </thead>
        </table>
      </React.Fragment>
    );
  }
}

export default CollectionByClients
