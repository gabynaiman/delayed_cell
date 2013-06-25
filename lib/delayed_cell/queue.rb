module DelayedCell
  class Queue
    
    def initialize(target)
      @target = target
      @jobs = []
      @worker = Worker.new target, self
    end

    def push(job)
      @jobs << job
      @worker.async.start
    end

    def pop
      @jobs.shift
    end

  end
end
