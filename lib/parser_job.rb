class ParserJob    
      def run(source:)
        validate_source(source)
        Parser.run( 
                    source: source, 
                    input_parser: InputParsers::LogFileParser, 
                    template: LineTemplates::UriHitTemplate,
                    calculator: UriHitService,
                    output: ConsoleWriter,
                  )
      end

      private

      def validate_source(source)
        raise ArgumentError, "Source can't be blank" if source.nil? || source.strip.empty?
      end
end