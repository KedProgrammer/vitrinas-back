class ApplicationService
  include ActionView::Helpers::NumberHelper

  def self.call(*args, &block)
    new(*args, &block).call
  end
end