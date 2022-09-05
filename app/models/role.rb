class Role < ActiveRecord::Base
	has_many :auditions

	def actors
		self.auditions.map { |audition| audition.actor }
	end

	def locations
		self.auditions.map { |audition| audition.location }
	end

	def lead
		lead_exists = self.auditions.find_by(hired: true)
		lead_exists ? lead_exists : "no actor has been hired for this role"
	end

	def understudy
		all_hired = self.auditions.where(hired: true)
		if all_hired.size >= 2
			all_hired[1]
		else
			"no actor has been hired for understudy for this role"
		end

	end

end