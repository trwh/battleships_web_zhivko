cell_names = {'A'=>1, 'B'=>2, 'C'=>3, 'D'=>4, 'E'=>5, 'F'=>6}

  # <tr>
  #   <td>test</td>
  #   <td>test2</td>
  #   <td>test3</td>
  # </tr>
  # <tr>
  #   <td>test4</td>
  # </tr>

def print_stuff(cell_names)
index = 0
  while index<cell_names.size
    p cell_names.keys[index..index+2]
    index=index+3
  end
end

p print_stuff(cell_names)

def print_table(cell_names)
result = ""
cell_names.keys.each do |el|
  result += "<td>#{el}</td>"
end
result
end

p print_table(cell_names)