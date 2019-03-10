Rails.application.routes.draw do
  post 'messages/reply' => 'messages#reply'
end
