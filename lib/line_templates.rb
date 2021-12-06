module LineTemplates
    class UriHitTemplate
      attr_reader :line
      def initialize(line:)
        @line = line
      end

      def run
        uri, ip = Lexer.run(line, LexerTypes::SimpleSpace)
        raise ArgumentError if uri.nil? || ip.nil?
        hit = Hit.new(uri: uri, ip: ip)
      end

    end
end