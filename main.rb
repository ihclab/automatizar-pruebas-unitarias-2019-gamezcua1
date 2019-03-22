require_relative "Medias"

require_relative "Medias"
require_relative "Helpers"
require_relative "Asserts"

pruebas_file_path = ARGV[0]
success = 0
failed = 0
log_file = File.open("#{Time.now.strftime("%d-%m-%Y %H:%M")} Resultados#{pruebas_file_path}", "w")

if pruebas_file_path == nil
  puts "No introdujo el nombre del archivo de pruebas"
  return 0
end

begin
  initial_log = "ID\tResultado\tMétodo\t\t\tDetalles\n"\
                "==========================================================\n\n"
  puts initial_log
  log_file.puts initial_log

  File.readlines(pruebas_file_path).each do |line|
    test_case = Helpers.get_test_params line    # Caso de prueba
    values = Helpers.get_values test_case[2]    # Parámetros que nuestras funciones recibirán
    waited_reult = Helpers.result_to_double test_case[3]  # Resultado esperado en la prueba

    begin
      start = Time.now
      res = Medias.send(test_case[1], values)
      execution_time = ((Time.now - start) * 1000).round(3)

      assert = Asserts.assertEqual res, waited_reult
      if assert
        log = "#{test_case[0]}\tÉxito\t\t#{test_case[1]}\t\t"\
             "Calculado = #{res} T.E: #{ execution_time } ms"
        success += 1
      else
        log = "#{test_case[0]}\tFalla\t\t#{test_case[1]}\t\t"\
             "Calculado = #{res}  Esperado = #{waited_reult} "\
             "T.E: #{ execution_time } ms"
        failed += 1
      end
    rescue NoMethodError
      log = "#{test_case[0]}\t\t\t #{test_case[1]} no existe"
    rescue NotImplementedError
      log = "#{test_case[0]}\t\t\t #{test_case[1]} no implementado"
    end

    if assert == true
      puts log.green
    elsif assert == false
      puts log.red
    else
      puts log
    end
    log_file.puts log
  end


  final_log = "\n=================== Final de la prueba ==================="\
              "\n\tÉxito = #{ success }\t\tFalla = #{ failed }"
  puts final_log
  log_file.puts final_log

rescue Errno::ENOENT
  p "El archivo introducido no existe"
end

log_file.close
