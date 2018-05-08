module ApplicationHelper
  def generate_id(prefix,model)
    id = prefix+Time.new.year.to_s.slice(2,3)+"-"
    count = sprintf "%07d", model.count.to_s
    id+= count
    return id
  end
end
