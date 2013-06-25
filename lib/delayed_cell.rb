Dir["#{File.dirname(__FILE__)}/delayed_cell/*.rb"].each { |file| require file }

module DelayedCell
  module Delay

    def delay
      @delay_proxy ||= Proxy.new self
    end

  end
end
