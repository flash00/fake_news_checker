class Article < ActiveRecord::Base
  # Remember to create a migration!
  has_many  :users, through: :articles_users

  validats  :title, presence: true
end
