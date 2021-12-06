class Lexer
    def self.run(line, type)
        type.new(line: line).run
    end
end