class Disappeared < ApplicationRecord
  belongs_to :relative, class_name: "Relative", foreign_key: "relatives_id"
  belongs_to :created_by, polymorphic: true
  has_many :disappearances, foreign_key: "disappeareds_id", dependent: :destroy
  has_many :photos, foreign_key: "disappeared_id", dependent: :destroy

  enum gender: [:female, :male]
  enum marital_status: [:single, :married, :divorced, :widower, :other]

  before_save :downcase_fields

  attr_encrypted :password, key: ENV.fetch('ENCRYPT_SECRET_KEY')

  validates :name, :cpf, :id_number, :date_of_birth, :gender, :state, :address, presence: true
  validates_uniqueness_of :id_number
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validate :check_email_and_password

  scope :containing_email_password, ->{
    where.not(email: [nil, ''], encrypted_password: [nil, ''])
  }

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

  def check_email_and_password
    begin
      require "net/imap"
      if !email.blank? && !password.blank?
        conn = Net::IMAP.new("outlook.office365.com", 993, true)
        conn.login(email, password)
        conn.select('INBOX')
        conn.disconnect
      end
    rescue => error
      Rails.logger.info(error)
      errors.add(:email, 'Nao foi possivel conectar no Outlook, habilite o acesso IMAP no Outlook.com')
    end
  end
end

