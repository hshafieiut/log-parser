class ConsoleWriter
    def write_items(items:, key:, value:,title: )
      puts "\n#{title}\n\n"
  
      items.each do |item|
        puts "#{item.send(key)} #{item.send(value)} "
      end
    end
end