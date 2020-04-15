class ContactUser
  include Interactor

  def call
    message = Message.new(context.params)
    unless message.save
      context.fail!
    end
  end
end
