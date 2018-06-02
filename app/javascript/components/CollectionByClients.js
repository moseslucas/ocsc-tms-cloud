import React from "react"
import PropTypes from "prop-types"
import ModalPayment from './ModalPayment'

class CollectionByClients extends React.Component {
  constructor (props) {
    super(props)
    this.cancelSelection = this.cancelSelection.bind(this)
    this.state = {
      checkedCargos: []
    }
  }

  cancelSelection () {
    this.setState({ checkedCargos: [] })
    $('.checkbox').removeAttr('checked')
  }

  selection () {
    const { checkedCargos } = this.state
    const total = 0
    return <div style={styles}>
      <div className='row'>
        <div className='col-xs-1'>
          <button 
              onClick={this.cancelSelection}
              title='Cancel Selection'
              className='btn btn-lg btn-outline btn-block'
              style={{ backgroundColor: '#EFF3F8' }}>
            <i className='fa fa-close' style={{ color: 'red' }} />
          </button>
        </div>
        <div className='col-xs-3' style={{ marginTop: '12px' }}>
          <label><strong> {`PHP: ${total}`} </strong></label>
        </div>
        <div className='col-xs-3' style={{ marginTop: '12px' }}>
          <label><strong> {`SELECTED: ${checkedCargos.length}`} </strong></label>
        </div>
        <div className='col-xs-5'>
          <button 
              onClick={ () => $('#payments_modal_new').modal('show') }
              className='btn btn-lg green-jungle btn-block'>
            MAKE PAYMENT
          </button>
        </div>
      </div>
    </div>
  }

  checked (e, cargo) {
    let newCheckedCargos = this.state.checkedCargos
    if (e.target.checked) {
      newCheckedCargos = newCheckedCargos.concat(cargo)
    } else {
      newCheckedCargos = newCheckedCargos.filter( checkedCargo => checkedCargo.id !== cargo.id )
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
            <label><input
              className='checkbox'
              type='checkbox'
              onChange={ e => this.checked(e, c) } />
            </label>
          </div>
        </td>
      </tr>
    })
  }
  render () {
    const { checkedCargos } = this.state
    return (
      <React.Fragment>
        <ModalPayment date={this.props.date}/>
        { checkedCargos.length > 0 && this.selection() }
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

const styles = {
  position: 'fixed',
  left: 0,
  bottom: 0,
  width: '100%',
  backgroundColor: '#EFF3F8',
  textAlign: 'center',
  zIndex: 3000
}

export default CollectionByClients
