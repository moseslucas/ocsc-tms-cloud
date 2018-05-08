class PaymentsController < ApplicationController
  include DocumentsHelper

  before_action :get_inital_report, only: [:cargo_collect_report, :cargo_transaction_report]

  def daily_report
  end

  def cargo_collect_report
    @date = params[:date]
    @report = @initial_report
    .where(payments: {payment_type: nil})
    .or(@initial_report.where(payments: {payment_type: "collect"}))
  end

  def cargo_transaction_report
    @date = params[:date]
    @report_totals = {collect: 0, cash: 0, remittance: 0, total: 0, qty: 0}
    @report = @initial_report.cargo.map do |waybill|
      payment_mode = payment_mode waybill.id
      if waybill.status1 === 0
        amount = 0.00
        cash = 0.00
        collect = 0.00
        qty = 0
      else
        amount = waybill.total_amount
        cash = (payment_mode === "cash" ? amount : 0.00)
        collect = (payment_mode === "collect" ? amount : 0.00)
        qty = waybill.document_details.sum(:qty)
      end
      {
        cwb: "#{remove_cwb_waybill_batch_prefix waybill.ref_id}",
        tags: format_document_tags(waybill.document_tags.ids),
        qty: qty,
        cash: cash,
        collect: collect,
        total: amount,
        remittance: cash,
        deleted: waybill.status1 === 0
      }
    end
  end

  private

  def get_inital_report
    @initial_report = Document.includes(
      :client,
      :document_details,
      :payments
    ).from_exact_branch(session[:branch])
    .where(documents: {trans_date: params[:date]})
  end

end
