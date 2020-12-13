class ContactForm < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :file, attachment: true

  attribute :message
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "My Contact Form",
      to: "your.email@your.domain.com",
      from: %("#{name}" <#{email}>)
    }
  end
end

c = Contact.new(nickname: 'not_blank', email: 'your@email.com', name: 'José')
c.valid?   #=> true
c.spam?    #=> true  (raises an error in development, to remember you to hide it)
c.deliver  #=> false (just delivers if is not a spam and is valid, raises an error in development)

c = Contact.new(email: 'invalid')
c.valid?               #=> false
c.errors.inspect       #=> { name: :blank, email: :invalid }
c.errors.full_messages #=> [ "Name can't be blank", "Email is invalid" ]

c = Contact.new(name: 'José', email: 'your@email.com')
c.deliver
