class FileProcessor
    attr_reader :path

    def initialize(path:, template:)
        @path= path
        @template= template
    end

    def process
      validate_path
      items = []
      File.open(path, 'r') do |f|
        f.each_line do |line|
          items << interpret_line(line)
        end
        f.close
      end
      items
    end

    def interpret_line(line)
        LineTemplate.interpret(line: line, template: @template)
    end

    private
    
    def validate_path
      raise ArgumentError, "Log file doesn't exist" unless File.file?(path)
    end
end