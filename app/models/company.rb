class Company < ApplicationRecord
  has_rich_text :description
  validates :email, presence: true, uniqueness: true
  validate :custom_email_validation

  private

  def custom_email_validation
    base_domain_string = "getmainstreet.com"
    index = email.index("@")
    domain_string = email[(index+1)..-1] 
    errors.add(:email, "email is not valid!") if domain_string != base_domain_string
  end
end
