class Code < ApplicationRecord
  validate :code_begins_with_tsla

  validates_format_of :code, with: /https?:\/\/ts.la\/\w+/i, message: "should follow the format https://ts.la/name12345"

  def code_begins_with_tsla
    errors.add(:code, "should begin with https://ts.la/") unless code.downcase.start_with?('https://ts.la/', 'http://ts.la/')
  end
end
