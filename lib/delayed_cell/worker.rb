require 'celluloid'

module DelayedCell
  class Worker

    include Celluloid

    def initialize(target, queue)
      @target = target
      @queue = queue
    end

    def start
      while job = @queue.pop do
        execute job
      end
    end

    private

    def execute(job)
      @target.send job.name, *job.arguments
    end

  end
end
