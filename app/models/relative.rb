class Relative < ApplicationRecord
  has_many :disappeareds, foreign_key: "relatives_id", dependent: :destroy
  belongs_to :created_by, polymorphic: true

  enum relative_degree: [:grandparents, :great_grandmother, :great_grandson, :companion, :spouse,
  :stepson, :ex_wife, :ex_husband, :son, :grandson, :father, :mother]
  validates :relative_name, :id_number, :relative_degree, :telephone, :cell_phone, :address, presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :id_number
  before_save :downcase_fields



  def downcase_fields
    self.relative_name.downcase!
    self.address.downcase!

  end

  def relative_degree_human
    Relative.human_attribute_name("relative_degree.#{relative_degree}") if relative_degree.present?
  end


  # Traz lista de endereços traduzidos
  def self.relative_degree_type_list_for_select
    relative_degrees.map { |type, _index| [human_attribute_name("relative_degree.#{type}"), type]}
  end

  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
        value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  end

end
