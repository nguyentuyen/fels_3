class Lesson < ActiveRecord::Base
	belongs_to :category
  belongs_to :user
  has_many :results 
  has_many :words, through: :results

  validates :category_id, presence: true
  accepts_nested_attributes_for :results
end
