module ProductsHelper
  def create_table_header(header_list)
    raw(header_list.inject("<tr>") { |h, column| h += "<th><strong>#{column}</strong></th>" } + "</tr>")
  end

  def create_data_row(data, methods_list)
    raw(methods_list.inject("") do |r, m| 
      res = data.send(m)
      
      r += "<td>#{res.to_s}</td>" 
    end)
  end
end
