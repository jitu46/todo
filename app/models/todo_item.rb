class TodoItem < ApplicationRecord
  belongs_to :todo_list 
  has_many :notifications , dependent: :destroy 

  def completed?
  	!completed_at.blank?
  end

  def not_completed?
  	completed_at.blank?
  end
end
