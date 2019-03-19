require_relative "Medias"

require_relative "Medias"
require_relative "Helpers"
require_relative "Asserts"

pruebas_file_path = ARGV[0]

if pruebas_file_path == nil
  puts "No introdujo el nombre del archivo de pruebas"
  return 0
end

File.readlines(pruebas_file_path).each do |line|
  test_case = Helpers.get_test_params line    # Caso de prueba
  values = Helpers.get_values test_case[2]    # Parámetros que nuestras funciones recibirán
  waited_reult = Helpers.result_to_double test_case[3]

  begin
    method_exists = true
    res = Medias.send(test_case[1], values)
    assert = Asserts.assertEqual res, waited_reult

    p assert ? "Éxito" : "*Falla*"
  rescue
    method_exists = false
    p "Método no existe"
  end

end
