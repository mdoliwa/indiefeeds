class BaseCommand
  def self.call(*args, **keyword_args)
    new(*args, **keyword_args).call
  end
end
