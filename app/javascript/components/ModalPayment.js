import React from 'react'
import axios from 'axios'

const ModalPayment = ({
  date,
  client,
  checkedCargos,
  employees
}) => {
  const total = checkedCargos.reduce((sum, value) => sum + parseFloat(value.balance), 0)
  const overPayment = client.over_payment ? client.over_payment : 0
  // $('#f_employees').select2({ theme: 'bootstrap' })

  const confirm = () => {
    const data = {
      payment: {
        client,
        amount: $('#amount').val(),
        trans_date: $('#f_trans_date').val(),
        deposit_date: $('#f_deposit_date').val(),
        ref_id: $('#f_ref_id').val(),
        employee_id: $('#f_employees').val(),
        description: $('#f_description').val(),
        documents: checkedCargos
      }
    }

    axios({
      method: 'POST',
      url: '/payments/create_multiple/',
      data
    }).then( data => {
      if (data.status === 200) {
        setTimeout(location.reload.bind(location), 5000);
      } else {
      }
    })
  }

  return (
    <div className="modal fade" id="payments_modal_new" aria-hidden="true">
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header">
            <button type="button" className="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 className="modal-title"><i className="icon-plus"></i> New Payment</h4>
          </div>

          <div className="modal-body">
            <div className="row">
              <div className="col-md-7">
                <div id="div_f_amount" className="form-group form-md-line-input">
                  <input
                    id='amount'
                    type="number"
                    className="form-control md"
                    defaultValue={ overPayment >= total ? 0 : (total-overPayment) }
                  />
                  <label>Enter Payment</label>
                  <span className="help-block">Enter Payment Amount</span>
                </div>
              </div>

              <div className="col-md-6">
                <div id="div_f_amount" className="form-group form-md-line-input">
                  <input type="number" className="form-control md" value={overPayment} disabled/>
                  <label>Previous Overpayment</label>
                </div>
              </div>

              <div className="col-md-6">
                <div id="div_f_amount" className="form-group form-md-line-input">
                  <input type="number" className="form-control md" value={total} disabled/>
                  <label>Amount Due</label>
                </div>
              </div>

              <div className="col-md-6">
                <div id="div_f_trans_date" className="form-group form-md-line-input">
                  <input type="date" className="form-control md" id="f_trans_date" name="f_trans_date" value={date} />
                  <label>Payment Date</label>
                </div>
              </div>

              <div className="col-md-6">
                <div id="div_f_deposit_date" className="form-group form-md-line-input">
                  <input type="date" className="form-control md" id="f_deposit_date" name="f_deposit_date" value={date} />
                  <label>Deposit Date</label>
                </div>
              </div>

              <div className="col-md-6">
                <div id="div_f_ref_id" className="form-group form-md-line-input">
                  <input className="form-control md" id="f_ref_id" name="f_ref_id" />
                  <label>A.R./O.R. #</label>
                  <span className="help-block">This field is Optional</span>
                </div>
              </div>

              <div className="col-md-6">
                <div id="div_f_employee" className="form-group form-md-line-input">
                  <select className="form-control md" id='f_employees'>
                    <option value='none'>SELECT EMPLOYEE</option>
                    {
                      employees.map( e => {
                        return <option value={e.id}>
                          {e.name}
                        </option>
                      })
                    }
                  </select>
                  <label>Employee</label>
                  <span className="help-block">Collector / Clerk</span>
                </div>
              </div>

              <div className="col-md-9">
                <div id="div_f_description" className="form-group form-md-line-input">
                  <input className="form-control md" id="f_description" name="f_description" />
                  <label>Remarks</label>
                  <span className="help-block">Enter Note/Description</span>
                </div>
              </div>
            </div>

            <div className="modal-footer">
              <button type="button" className="btn btn-outline sbold red" data-dismiss="modal">Close</button>
              <button id="btn_confirm" className="btn btn-outline sbold green" onClick={_ => confirm()}>Confirm</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default ModalPayment
