import React from "react"
import PropTypes from "prop-types"
class Collection extends React.Component {
  status1 (status1) {
    if (status1 === 'OPEN')
      return <span className='label label-warning'> OPEN </span>
    else if (status1 === 'CLOSED')
      return <span className='label label-default'> CLOSED </span>
  }

  list () {
    return this.props.collection.map((c,i)=> {
      return <tr key={i}>
        <td> {c.refId}</td>
        <td> {c.clientName} </td>
        <td> {c.transDate} </td>
        <td> {c.branch} </td>
        <td> {c.destination} </td>
        <td> { this.status1(c.status1) }</td>
        <td> {c.totalAmount} </td>
        <td>
          <button className='btn dark btn-outline'>
            View
          </button>
        </td>
      </tr>
    })
  }
  render () {
    return (
      <React.Fragment>
        <table className='table table-striped'>
          <thead>
            <tr>
              <th> CWB </th>
              <th> Client </th>
              <th> Date </th>
              <th> Branch </th>
              <th> Destination </th>
              <th> Status </th>
              <th> Total </th>
              <th></th>
            </tr>
          </thead>
          <tbody> {this.list()} </tbody>
        </table>
      </React.Fragment>
    );
  }
}

export default Collection
