class Portfolio < ApplicationRecord
  # Placeholder - model concern to place the image
  # include Placeholder
  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  #after_initialize :set_defaults
  # the mount_uploader setup above causes this to cease to function

  # def set_defaults
  #   self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
  #   self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  # end
end
