require_relative "Medias"

require_relative "Medias"
require_relative "Helpers"

pruebas_file_path = ARGV[0]

if pruebas_file_path == nil
  puts "No introdujo el nombre del archivo de pruebas"
  return 0
end

File.readlines(pruebas_file_path).each do |line|
  test_case = Helpers.get_test_params line    # Caso de prueba
  values = Helpers.get_values test_case[2]    # Parámetros que nuestras funciones recibirán
  waited_reult = Helpers.result_to_double test_case[3]

  p test_case
  p values
  p waited_reult
end
