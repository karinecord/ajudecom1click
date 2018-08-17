# CPF and CNPJ validators Rails 3+ style
# By Arthur Corenzan <arthur@corenzan.com>
# Based on the work of André Camargo <andre@boaideia.inf.br>
#
# Copy this file to your initializers or lib directory, then apply like this:
#
# class Person
#   ...
#
#   validates :cpf, :cpf => true
#   validates :cnpj, :cnpj => true
# end

class CpfValidator < ActiveModel::EachValidator
  def is_cpf?(value)
    match = value.gsub(/\D/, "").scan(/\d/).collect(&:to_i)

    if match.size == 11
      sum = 10 * match[0] + 9 * match[1] + 8 * match[2] + 7 * match[3] + 6 * match[4] + 5 * match[5] + 4 * match[6] + 3 * match[7] + 2 * match[8]
      sum = sum - (11 * (sum / 11))
      m = (sum == 0 || sum == 1) ? 0 : 11 - sum

      if m == match[9]
        sum = match[0] * 11 + match[1] * 10 + match[2] * 9 + match[3] * 8 + match[4] * 7 + match[5] * 6 + match[6] * 5 + match[7] * 4 + match[8] * 3 + match[9] * 2
        sum = sum - (11 * (sum / 11))
        n = (sum == 0 or sum == 1) ? 0 : 11 - sum

        return n == match[10]
      end
    end

    false
  end

  def validate_each(record, attribute, value)
    unless is_cpf?(value)
      message = I18n.translate("errors.cpf.invalid")
      record.errors[attribute] << message
    end
  end
end
#
# class CnpjValidator < ActiveModel::EachValidator
#   def is_cnpj?(value)
#     match = value.gsub(/\D/, "").scan(/\d/).collect(&:to_i)
#
#     if match.size == 14
#       match = match.collect{|x| x.to_i}
#       sum = match[0] * 5 + match[1] * 4 + match[2] * 3 + match[3] * 2 + match[4] * 9 + match[5] * 8 + match[6] * 7 + match[7] * 6 + match[8] * 5 + match[9] * 4 + match[10] * 3 + match[11] * 2
#       sum = sum - (11 * (sum / 11))
#       m = (sum == 0 || sum == 1) ? 0 : 11 - sum
#
#       if m == match[12]
#         sum = match[0] * 6 + match[1] * 5 + match[2] * 4 + match[3] * 3 + match[4] * 2 + match[5] * 9 + match[6] * 8 + match[7] * 7 + match[8] * 6 + match[9] * 5 + match[10] * 4 + match[11] * 3 + match[12] * 2
#         sum = sum - (11 * (sum / 11))
#         n = (sum == 0 || sum == 1) ? 0 : 11 - sum
#
#         return n == match[13]
#       end
#     end
#
#     false
#   end
#
#   def validate_each(record, attribute, value)
#     unless is_cnpj?(value)
#       message = I18n.translate("errors.messages.invalid")
#       record.errors[attribute] << message
#     end
#   end
# end