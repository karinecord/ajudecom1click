class ContactForm
  include ActiveModel::Model
  include ActiveModel::Validations
  attr_accessor :name, :email, :content
  validates :name, :email, :content, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
        value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  end

end
