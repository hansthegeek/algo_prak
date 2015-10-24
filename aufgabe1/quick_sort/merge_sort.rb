def split list
  part = []
  while part.length < list.length
    part << list.pop
  end
  [list, part]
end

def merge a, b
  res =[]
  until a.empty? or b.empty?
    res << (a.first < b.first ? a.shift : b.shift)
  end
  res.concat(a).concat(b)
end

def merge_sort list
  if list.length > 2
    splitted = split list # Teilen
    merge merge_sort(splitted[0]), merge_sort(splitted[1]) # Rekrusion
  elsif list.length == 1
    return list  # Trivialfall: Ein Element sortieren
  else
    merge [list[0]], [list[1]] # Trivialfall: Zwei Elemente sortieren   
  end
end

if ARGV.size == 1
  File.open ARGV[0] do |file|
	  raw = file.read.split ','
	  sorted = merge_sort raw.inject [] { |mem, var| mem << var.to_i }
    puts sorted.join ','
  end
else
  puts "usage [ruby] merge.rb <file>"
end
