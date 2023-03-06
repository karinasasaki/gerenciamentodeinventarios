class Inventory
    attr_accessor :products
    def initialize()
        @products = []
    end
    
    def add_item
        name = ""
        amount = 0
        price = 0

        until name.empty? == false do
            puts "\n"
            print "Nome: "
            name = gets.chomp
            if name.empty? == true
                puts "\n"
                puts "ERRO! O nome não deve ser vazio, digite novamente."
            end
        end

        until amount > 0 do
            puts "\n"
            print "Quantidade: "
            amount = gets.chomp.to_i
            if amount <= 0
                puts "\n"
                puts "ERRO! A quantidade deve ser maior que 0, digite novamente."
            end
        end

        until price > 0 do
            puts "\n"
            print "Preço unitário: " 
            price = gets.chomp.to_f
            if price <= 0
                puts "\n"
                puts "ERRO! O preço deve ser maior que 0, digite novamente."
            end
        end
        
        @products << Product.new(name, amount, price)
        
        puts "\n"
        puts "Item adicionado com sucesso!"
    end
    
    def remove_item
        puts "\n"
        print "Qual produto deseja excluir? "
        product = gets.chomp
        productWasDeleted = false

        @products.each do |item|
            if item.name.downcase.include?(product.downcase)
                id = @products.index(item)
                @products.delete_at(id)
                puts "\n"
                puts "#{item.name} excluído do estoque!"
                productWasDeleted = true
            end
        end
    
        if productWasDeleted == false
            puts "\n"
            puts "Produto não encontrado."
        end
    end
    
    def list_item
        @products.each do |item|
            puts "\n"
            puts "Nome: #{item.name}\n"
            puts "Quantidade: #{item.amount}\n"
            puts "Preço unitário: R$#{item.price}\n\n"
        end
    
        if @products.empty? == true
            puts "\n"
            puts "Nenhum item encontrado."
            puts "\n"
        end
    end
    
    def show_item
        puts "\n"
        print "Qual produto deseja visualizar? "
        product = gets.chomp
        productNotFound = true
    
        @products.each do |item|
            if item.name.downcase.include?(product.downcase)
    
                puts "\n"
                puts "Nome: #{item.name}\n"
                puts "Quantidade: #{item.amount}\n"
                puts "Preço unitário: R$#{item.price}\n"
                puts "Valor total do item no estoque: R$#{item.totalValue()}"
                productNotFound = false
            end
        end
    
        if productNotFound == true
            puts "\n"
            puts "Produto não encontrado."
        end
    end
    
    def total_value
        value = 0
        @products.each do |item|
            value = value + item.amount.to_i * item.price.to_f
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

        @products.each do |item|
            if item.name.downcase.include?(product.downcase)
                if field.downcase.include?("nome")
                    puts "\n"
                    print "Digite o novo nome: "
                    item.name = gets.chomp
                    puts "\n"
                    puts "Produto editado!"
                elsif field.downcase.include?("quantidade")
                    puts "\n"
                    print "Digite a nova quantidade: "
                    item.amount = gets.chomp
                    puts "\n"
                    puts "Produto editado!"
                elsif field.downcase.include?("preço")
                    puts "\n"
                    print "Digite o novo preço: "
                    item.price = gets.chomp
                    puts "\n"
                    puts "Produto editado!"
                else
                    puts "\n"
                    puts "Produto ou campo inválido."
                end
            end
        end
    end
end