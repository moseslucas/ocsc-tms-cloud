module DocumentsHelper
  def status1_meaning(status)
    if status == 0
      "<span class='label label-default'>CANCELLED</span>".html_safe
    elsif status == 1
      "<span class='label label-warning'>OPEN</span>".html_safe
    elsif status == 2
      "<span class='label label-default'>CLOSED</span>".html_safe
    else
      "<span class='label label-default'>Uknown</span>".html_safe
    end
  end

  def status2_meaning(status)
    if status == 0
      "<span class='label label-default'>CANCELLED</span>".html_safe
    elsif status == 1
      "<span class='label label-warning'>FOR DELIVERY</span>".html_safe
    elsif status == 2
      "<span class='label label-success'>IN TRANSIT</span>".html_safe
    elsif status == 3
      "<span class='label label-default'>RELEASED</span>".html_safe
    else
      "<span class='label label-default'>Uknown</span>".html_safe
    end
  end

  def remove_cwb_waybill_batch_prefix(ref_id)
    return ref_id[4..8]
  end

  def format_document_tags(tags)
    if tags.count > 1
      return "#{tags.first} - #{tags.last}"
    else
      return tags.join(" ")
    end
  end

  def payment_mode(doc_id)
    query = "documents.id as id, documents.status1 as status1,
    payments.payment_type as payment_type"
    a = Document.select(query).left_joins(:payments).find_by(documents:{id:doc_id})
    if a.status1==2 && a.payment_type=='cash'
      return 'cash'
    else
      return 'collect'
    end
  end

end
