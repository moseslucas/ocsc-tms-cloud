import React from 'react'

class MasterDeliveryItems extends React.Component {
  constructor (props) {
    super(props)
  }

  componentDidMount () {
    const { items } = this.props
    console.log('items: ', items)
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
          </tr>
        )
      })
    } else {
      return (
        <tr>
          <td colspan='8'> No Records </td>
        </tr>
      )
    }
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
      </React.Fragment>
    )
  }
}

export default MasterDeliveryItems
