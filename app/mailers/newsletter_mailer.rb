class NewsLetterMailer < ApplicationMailer
    def weeky(args)
        mail subject: args[:subject], to: args[:emails]
    end

    def monthly(args)
        mail subject: args[:subject], to: args[:emails]
    end

    def monthly(args)
        mail subject: args[:subject], to: args[:emails]
    end

end