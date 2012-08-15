class MailsController < ApplicationController
  protect_from_forgery :except => :create 

  before_filter :authorize, except: :create

  def index
    @mails = Mail.all
  end

  def show
  end

  def create
    envelope = JSON.parse params['envelope']
    user = User.find_by(email: envelope['from'])
    user.mails.create! content: params.slice('from', 'to', 'subject', 'text', 'attachments')
    render nothing: true
  rescue
    render nothing: true
  end
end
