class Inventory
    attr_accessor :products
    def initialize()
        @products = []
    end
    
    def add_item
        puts "\n"
        print "Nome: "
        name = gets.chomp
        print "Quantidade: "
        amount = gets.chomp.to_i
        print "Preço unitário: " 
        price = gets.chomp.to_f

        @products << Product.new(name, amount, price)
        
        puts "\n"
        puts "Item adicionado!"
    end
    
    def remove_item
        puts "\n"
        print "Qual produto deseja excluir? "
        product = gets.chomp
        status = false

        @products.each do |item|
            if item.name.downcase.include?(product.downcase)
                id = @products.index(item)
                @products.delete_at(id)
                puts "\n"
                puts "#{item.name} excluído do estoque!"
                status = true
            end
        end
    
        if status == false
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
        status = false
    
        @products.each do |item|
            if item.name.downcase.include?(product.downcase)
    
                puts "\n"
                puts "Nome: #{item.name}\n"
                puts "Quantidade: #{item.amount}\n"
                puts "Preço unitário: R$#{item.price}\n"
                puts "Valor total do item no estoque: R$#{item.totalValue()}"
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