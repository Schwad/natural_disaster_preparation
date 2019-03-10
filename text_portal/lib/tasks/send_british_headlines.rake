namespace :text_portal do
  desc 'Update british news'
  task british_news: :environment do
    User.all.each do |user|
      if user.configurations['subscribed_to_auto_brit_updates']
        TwilioTextMessenger.new(News.new("british").call.join("\n\n---------\n\n"), user.phone_number).call
      end
    end
  end
end
