module StudioGame
  module Line
    def self.print_line
      i = 0
      line = '-'
      while i < 60
        line << '-'
        i += 1
      end
      puts line
    end
  end
end
