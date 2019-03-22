require_relative "Medias"

require_relative "Medias"
require_relative "Helpers"
require_relative "Asserts"

pruebas_file_path = ARGV[0]
success = 0
failed = 0

if pruebas_file_path == nil
  puts "No introdujo el nombre del archivo de pruebas"
  return 0
end

begin
  puts "ID\tResultado\tMétodo\t\t\tDetalles"
  puts "=========================================================="

  File.readlines(pruebas_file_path).each do |line|
    test_case = Helpers.get_test_params line    # Caso de prueba
    values = Helpers.get_values test_case[2]    # Parámetros que nuestras funciones recibirán
    waited_reult = Helpers.result_to_double test_case[3]  # Resultado esperado en la prueba

    begin
      res = Medias.send(test_case[1], values)
      assert = Asserts.assertEqual res, waited_reult

      if assert
        puts "#{test_case[0]}\t#{ "Éxito".green }\t\t#{test_case[1]}\t\tCalculado = #{res}"
        success += 1
      else
        puts "#{test_case[0]}\t#{ "Falla".red }\t\t#{test_case[1]}\t\tCalculado = #{res} \t Esperado = #{test_case[3]}"
        failed += 1
      end
    rescue NoMethodError
      puts "#{test_case[0]}\t\t\t #{test_case[1]} no existe"
    rescue NotImplementedError
      puts "#{test_case[0]}\t\t\t #{test_case[1]} no implementado"
    end
  end

  puts "\t\t#{ "Éxito = ".green }#{ success.to_s.green }\t\t#{ "Falla = ".red }#{ failed.to_s.red }"

rescue Errno::ENOENT
  p "El archivo introducido no existe"
end
