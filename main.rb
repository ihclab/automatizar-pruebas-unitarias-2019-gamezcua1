require_relative "Medias"

require_relative "Medias"

pruebas_file_path = ARGV[0]

if pruebas_file_path == nil
  puts "No introdujo el nombre del archivo de pruebas"
  return 0
end

File.readlines(pruebas_file_path).each do |line|
  print line
end
