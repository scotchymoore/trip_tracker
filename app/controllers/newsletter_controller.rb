class NewsletterController < ApplicationController
  def new
  end

  def create
  NewsLetterJob.perform({
                        emails: params[:emails],
                        subject: params[:subject],
                        newsletter: params[:newsletter],
                      })
  flash[:success] = "Thank you for providing us with your credit card 
  number and mother's maiden name..you should probably call your bank
  now......Sincerely, your favorite Nigerian prince."
  redirect_to new_newsletter_path

  end
end
