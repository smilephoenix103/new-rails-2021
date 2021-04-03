class Element
    String @name
    String @lastname
    Float @age = 0
    def initialize()
    end
    attr_reader :name, :lastname, :age
    attr_writer :name, :lastname, :age

    def to_s
        printf " %-35s %-10s %-10s",@name, @lastname, @age
    end
end