module DelayedCell
  class Proxy
    
    def initialize(target)
      @queue = Queue.new target
    end

    def method_missing(method, *args, &block)
      @queue.push Job.new(method, args)
    end

  end
end