module InputParsers
    class LogFileParser  
      def initialize(source:, template:, calculator:, output:)
        @source = source
        @file_processor = FileProcessor.new(path: source, template: template)
        @calculator = calculator.new
        @output = output
      end

      def run
        items = @file_processor.process
        stats = @calculator.calculate(items)
        generate_output(stats)
      end

      private

      def generate_output(stats)
        OutputBuilder.new(stats: stats, output: @output).build
      end
    end
end