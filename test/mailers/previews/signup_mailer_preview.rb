# Preview all emails at http://localhost:3000/rails/mailers/signup_mailer
class SignupMailerPreview < ActionMailer::Preview
  def new_signup_preview
    SignupMailer.new_signup(User.first)
  end
end
