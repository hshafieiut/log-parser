class Parser
    def self.run(source:, input_parser:, template:, calculator:, output:)
        input_parser.new(source: source, template: template, calculator: calculator, output: output).run
    end
end