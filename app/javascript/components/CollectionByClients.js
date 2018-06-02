import React from "react"
import PropTypes from "prop-types"
class CollectionByClients extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      checkedCargos: []
    }
  }

  checked (e, id) {
    let newCheckedCargos = this.state.checkedCargos
    if (e.target.checked) {
      newCheckedCargos = newCheckedCargos.concat(id)
    } else {
      newCheckedCargos = newCheckedCargos.filter( cargoIds => cargoIds !== id )
    }
    this.setState({ checkedCargos: newCheckedCargos })
  }

  list () {
    return this.props.cargos.map((c, i)=> {
      return <tr key={i}>
        <td> {c.cwb} </td>
        <td> {c.shipper} </td>
        <td> {c.date} </td>
        <td> {c.destination} </td>
        <td> {c.status1} </td>
        <td> {c.total} </td>
        <td> {c.balance} </td>
        <td>
          <div className='checkbox'>
            <label><input type='checkbox' onChange={ e => this.checked(e, c.id) } /></label>
          </div>
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
              <th>CWB</th>
              <th>Shipper</th>
              <th>Date</th>
              <th>Destination</th>
              <th>Status</th>
              <th>Total</th>
              <th>Balance</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            { this.list() }
          </tbody>
        </table>
      </React.Fragment>
    );
  }
}

export default CollectionByClients
