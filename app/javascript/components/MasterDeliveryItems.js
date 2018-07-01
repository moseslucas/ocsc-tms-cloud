import React from 'react'

class MasterDeliveryItems extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      checkedItems: 0
    }
  }

  checked (e) {
    if (e.target.checked) {
      this.setState({ checkedItems: this.state.checkedItems + 1 })
    } else {
      this.setState({ checkedItems: this.state.checkedItems - 1 })
    }
  }

  tableHeader () {
    return (
      <thead>
        <tr>
          <th> # </th>
          <th> CWB </th>
          <th> Shipper </th>
          <th> Consignee </th>
          <th> QTY </th>
          <th> Description </th>
          <th> Destination </th>
          <th>  Amount </th>
          <th />
        </tr>
      </thead>
    )
  }

  records () {
    const { items } = this.props
    if (items.length > 0) {
      return items.map((item, i) => {
        return (
          <tr key={i+1}>
            <td>{i}</td>
            <td>{item.ref_id}</td>
            <td>{item.shipper}</td>
            <td>{item.consignee}</td>
            <td>{item.qty}</td>
            <td>{item.description}</td>
            <td>{item.destination}</td>
            <td>{item.amount}</td>
            <td>
              <div className='checkbox'>
                <label><input
                  className='checkbox'
                  type='checkbox'
                  onChange={ e => this.checked(e) } />
                </label>
              </div>
            </td>
          </tr>
        )
      })
    } else {
      return (
        <tr>
          <td colspan='9'> No Records </td>
        </tr>
      )
    }
  }

  actions () {
    const { items } = this.props
    const { checkedItems } = this.state
    const allChecked = items.length === checkedItems
    return (
      <React.Fragment>
        <div className='row'>
          <div className='col-sm-8 col-xs-12 form-group' style={{display: 'flex'}}>
            <button className='btn green btn-lg' disabled={allChecked} style={{width: 180}}>
              <i className='fa fa-circle-o-notch' />
              LACKING
             </button>
            <input className='input-lg form-control' disabled={allChecked}/>
          </div>
          <div className='col-sm-1' />
          <div className='col-sm-3 col-xs-12 form-group'>
            <button className='btn btn-lg btn-block green-jungle pull-right' disabled={!allChecked}>
              <i className='fa fa-check' />
              SET TO COMPLETE
            </button>
          </div>
        </div>
      </React.Fragment>
    )
  }

  render () { 
    return (
      <React.Fragment>
        <table className='table table-striped table-hover'>
          { this.tableHeader() }
          <tbody>
            { this.records() }
          </tbody>
        </table>
        { this.actions() }
      </React.Fragment>
    )
  }
}

export default MasterDeliveryItems
