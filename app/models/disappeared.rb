class Disappeared < ApplicationRecord
  has_one :relative
  has_many :disappearances, foreign_key: "disappeareds_id", dependent: :destroy
  enum gender: [:female, :male]
  enum marital_status: [:single, :married, :divorced, :widower, :other]
  mount_uploader :photo, DisappearedUploader
  paginates_per 2
  validates :name, :email, :password, :date_of_birth, :gender, :state, :address, :photo, presence: true
  validates_uniqueness_of :id_number
  validates :cpf, :cpf => true
  before_save :downcase_fields
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  attr_encrypted :password, :key => "xw&(@q^lwe@aezz#ibzybqg@-m!+k_r1u*m#g*ej*_p%#6#^^c"

  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
        value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  end


  def downcase_fields
    self.name.downcase!
    self.nickname.downcase!
    self.nationality.downcase!
    self.state.downcase!
  end

  def gender_human
    Disappeared.human_attribute_name("gender.#{gender}") if gender.present?
  end

  def self.gender_type_list_for_select
    genders.map { |type, _index| [human_attribute_name("gender.#{type}"), type]}
  end

  def marital_status_human
    Disappeared.human_attribute_name("marital_status.#{marital_status}") if marital_status.present?
  end

  def self.marital_status_type_list_for_select
    marital_statuses.map { |type, _index| [human_attribute_name("marital_status.#{type}"), type]}
  end

  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
        value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  end

end
