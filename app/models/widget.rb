class Widget < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  has_one_attached :avatar

  before_create :generate_client_id

  def generate_client_id
    self.client_id = SecureRandom.hex(5)
  end

  validates :name, :welcome_message, :background_color, :shape, presence: true

end
