#Gerenciamento de estoque

@inventory = []

def add_item
    print "Nome: "
    name = gets.chomp
    print "Quantidade: "
    amount = gets.chomp.to_i
    print "Preço unitário: " 
    price = gets.chomp.to_f

    @inventory << {name: name, amount: amount, price: price}
    puts "\n"
    puts "Item adicionado!"
end

def remove_item
    puts "\n"
    print "Qual produto deseja excluir? "
    product = gets.chomp
    status = false

    @inventory.each do |item|
        if item[:name].downcase.include?(product.downcase)
            id = @inventory.index(item)
            @inventory.delete_at(id)
            puts "\n"
            puts "#{item[:name]} excluído do estoque!"
            status = true
        end
    end

    if status == false
        puts "\n"
        puts "Produto não encontrado."
    end
end

def list_item
    @inventory.each do |item|
        puts "\n"
        puts "Nome: #{item[:name]}\n"
        puts "Quantidade: #{item[:amount]}\n"
        puts "Preço unitário: R$#{item[:price]}\n\n"
    end

    if @inventory.empty? == true
        puts "\n"
        puts "Nenhum item encontrado."
        puts "\n"
    end
end

def show_item
    puts "\n"
    print "Qual produto deseja visualizar? "
    product = gets.chomp
    status = false

    @inventory.each do |item|
        if item[:name].downcase.include?(product.downcase)
            total_value_item = item[:amount].to_i * item[:price].to_f

            puts "\n"
            puts "Nome: #{item[:name]}\n"
            puts "Quantidade: #{item[:amount]}\n"
            puts "Preço unitário: R$#{item[:price]}\n"
            puts "Valor total do item no estoque: R$#{total_value_item}"
            status = true
        end
    end

    if status == false
        puts "\n"
        puts "Produto não encontrado."
    end
end

def total_value
    value = 0
    @inventory.each do |item|
        value = value + item[:amount].to_i * item[:price].to_f
    end

    print "Valor total do estoque: R$#{value}"
    puts "\n"
end

def edit_item
    puts "\n"
    print "Qual produto deseja editar? "
    product = gets.chomp
    puts "\n"
    print "Qual campo deseja editar? "
    field = gets.chomp

    @inventory.each do |item|
        if item[:name].downcase.include?(product.downcase)
    puts "\n"
            if field.downcase.include?("nome")
                puts "\n"
                print "Digite o novo nome: "
                item[:name] = gets.chomp
                puts "\n"
                puts "Produto editado!"
            elsif field.downcase.include?("quantidade")
                puts "\n"
                print "Digite a nova quantidade: "
                item[:amount] = gets.chomp
                puts "\n"
                puts "Produto editado!"
            elsif field.downcase.include?("preço")
                puts "\n"
                print "Digite o novo preço: "
                item[:price] = gets.chomp
                puts "\n"
                puts "Produto editado!"
            else
                puts "\n"
                puts "Produto ou campo inválido."
            end
        end
    end
end

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
        list_item
        total_value
    when 2
        show_item
    when 3
        add_item
    when 4
        edit_item
    when 5
        remove_item
    else
        puts "\n"
        puts "Opção inválida."
    end
end