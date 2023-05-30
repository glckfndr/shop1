module ProductsHelper
  def thead_tag(header_list)
    raw(header_list.inject("<thead> <tr>") { |th, column| th + "<th><strong>#{column}</strong></th>" } + "</tr></thead>")
  end

  def row_tag(data, *attrib)
    style = '"border border-slate-700"'
    td = "<td class=#{style}>"
    raw attrib.inject("") { |tr, attr| tr + "#{td}#{data.send(attr)}</td>" }
  end
end
