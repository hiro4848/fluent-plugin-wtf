

module Fluent
  class WtfOutput < Fluent::Output


    Fluent::Plugin.register_output('wtf', self)
    
    # config_param :hoge, :string, :default => 'hoge'
    
    def initialize
      super
      # require 'hogepos'
    end
    
    def configure(conf)
      super
      # @path = conf['path']
    end
    
    def start
      super
      # init
    end
    
    def shutdown
      super
      # destroy
    end

    def format(tag, time, record)
      [tag, time, record].to_msgpack
    end
    
    def emit(tag, es, chain)

      foo = "asdf"
      `echo "#{foo}" >> /tmp/out_wtf`

      chain.next
      es.each {|time,record|
        $stderr.puts "OK!"
      }
    end


  end
end
