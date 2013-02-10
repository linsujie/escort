module Escort
  module Setup
    module Dsl
      class Validations
        #TODO validations can possibly take a command name param so that we can output which validations
        #block we are dealing with if there is an error
        def initialize(&block)
          @validations = {}
          block.call(self) if block_given?
        rescue => e
          STDERR.puts "Problem with syntax of validations block"
          #TODO better error message, loggin etc.
          exit(Escort::CLIENT_ERROR_EXIT_CODE)
        end

        def validate(name, description, &block)
          @validations[name] ||= []
          @validations[name] << {:desc => description, :block => block}
        end
      end
    end
  end
end