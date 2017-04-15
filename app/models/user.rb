class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name
    self.name.split.first ##split will split the string at the first space or the supplied split point split(", ")
  end

  def last_name
    self.name.split.last
  end

end
