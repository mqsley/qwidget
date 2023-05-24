class Message < ApplicationRecord
  belongs_to :widget
  validates_presence_of :name, :email, :content

end
