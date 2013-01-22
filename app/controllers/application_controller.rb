class ApplicationController < ActionController::Base
  protect_from_forgery

  def execute(command, parameters = params)
    handler = find_handler_for(command)
    ActiveRecord::Base.transaction do
      handler.handle(parameters)
    end
  end

  def find_handler_for(command)
    "#{command}_command_handler".camelize.constantize.new
  end
end
