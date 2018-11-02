class Member < ApplicationRecord
  # Associations
  has_one :profile_member
  accepts_nested_attributes_for :profile_member

  # Validations
  validate :nested_attributes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    if nested_attributes_blank?
      errors.add(:base, "É necessário preencher os campos Primeiro e Segundo nome.")
    end
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.second_name.blank?
  end

  def name
    "#{profile_member.first_name} #{profile_member.second_name}".squish
  end
end
