# def tag(tag)
#   puts "<#{tag}>#{yield}</#{tag}>"
# end
def tag(name)
  print "<#{name}>"
  print yield
  print "</#{name}>\n"
end

tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end