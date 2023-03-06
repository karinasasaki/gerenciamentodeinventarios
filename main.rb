#Gerenciamento de estoque

require "./Product.rb"
require "./Inventory.rb"

inventory = Inventory.new()

loop do
    puts "\n"
    puts "-----------------------"
    puts "| 1. Lista do estoque |"
    puts "| 2. Detalhes do item |"
    puts "| 3. Adicionar item   |"
    puts "| 4. Editar item      |"
    puts "| 5. Excluir item     |"
    puts "| 0. Sair             |"
    puts "-----------------------"
    puts "\n"
    print "Selecione uma opção listada: "
    option = gets.chomp.to_i

    case option
    when 0
        puts "\n"
        puts "Até mais!\n\n"
        break
    when 1
        inventory.list_item
        inventory.total_value
    when 2
        inventory.show_item
    when 3
        inventory.add_item
    when 4
        inventory.edit_item
    when 5
        inventory.remove_item
    else
        puts "\n"
        puts "Opção inválida."
    end
end