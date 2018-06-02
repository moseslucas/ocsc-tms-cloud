import React from 'react'

const ModalPayment = ({ date }) => {
  return (
    <div className="modal fade" id="payments_modal_new" aria-hidden="true">
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header">
            <button type="button" className="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 className="modal-title"><i className="icon-plus"></i> New Payment</h4>
          </div>

          <div className="modal-body">
            <form role="form" id="payments_form">
              <div className="row">
                <div className="col-md-4">
                  <div className="md-checkbox form-group form-md-line-input">
                    <div className="md-checkbox">
                      <input type="checkbox" id="checkbox1" className="md-check" />
                        <label> Full Amount </label>
                    </div>
                  </div>
                </div>
              </div>

              <div className="row">
                <div className="col-md-4">
                  <div id="div_f_amount" className="form-group form-md-line-input">
                    <input type="number" className="form-control md" id="f_amount" name="f_amount" />
                    <label>Amount</label>
                    <span className="help-block">Enter Payment Amount</span>
                  </div>
                </div>

                <div className="col-md-4">
                  <div id="div_f_trans_date" className="form-group form-md-line-input">
                    <input type="date" className="form-control md" id="f_trans_date" name="f_trans_date" value={date} />
                    <label>Payment Date</label>
                  </div>
                </div>

                <div className="col-md-4">
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
                    <select className="form-control md" id="f_employee" name="f_employee"></select>
                    <label>Employee</label>
                    <span className="help-block">Collector / Clerk</span>
                  </div>
                </div>

                <div className="col-md-3">
                  <div id="div_f_payment_type" className="form-group form-md-line-input">
                    <select className="form-control md" id="f_payment_type" name="f_payment_type">
                      <option value="collect">Collect</option>
                      
                    </select>
                    <label>Payment Type</label>
                    
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
                <button id="btn_confirm" type="submit" className="btn btn-outline sbold green">Confirm</button>
              </div>

            </form>

          </div>
        </div>
      </div>
    </div>
  )
}

export default ModalPayment
