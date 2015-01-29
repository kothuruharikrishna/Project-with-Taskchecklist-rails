class Project < ActiveRecord::Base
	validates :name,:presence=> true
	validates_length_of :name, :in => 5..50
	has_many :tasks
	def incomplete_tasks
    tasks.where(complete: false)
  end

  def complete_tasks
    tasks.where(complete: true)
  end
end
