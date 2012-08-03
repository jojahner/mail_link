class Mail
  include Mongoid::Document
  field :content, type: Hash

  belongs_to :user

  def from
    content['from']
  end

  def to
    content['to']
  end

  def subject
    content['subject']
  end

  def text
    content['text']
  end
end
