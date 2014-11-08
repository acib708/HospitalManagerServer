require 'logger'

class CLogger

  def initialize
    @logger       = Logger.new(STDOUT)
    @logger.level = Logger::INFO
  end

  def update(time, update)
    @logger.info("(#{time}) #{update}")
  end

end