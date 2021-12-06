class LineTemplate
    def self.interpret(line:, template:)
        template.new(line: line).run
    end
end