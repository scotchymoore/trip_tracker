namespace :trip_users do
  desc "displays users emails and saves to file"
  task report: :environment do
    # open a file on the desktop
    user = `whoami`.strip
    open("/Users/#{user}/Desktop/trip_tracker_user_emails.txt", 'w+') do |f|
      # loop through all users in database
      User.all.each do |user|
        # write lines to that file of user email and beer count
        f << "#{user.email}\n"
      end
    end
    puts 'User email file generated!'
  end
end



