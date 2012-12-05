module Jotto
  class Game

	def initialize (max_guess_count, dict, secret)
		@guess_count = 0 
		@max_guess_count = max_guess_count
		@secret = ''
		@dict = dict
		@secret = secret
	end

	def guess_count
		return @guess_count 	
	end
	def max_guess_count
		return @max_guess_count
	end
	def secret
		return @secret
	end
	def dict
		return @dict
	end


	def guess (something)
		@guess_count += 1
	end
	def new_game ()
		@guess_count = 0
		@secret = @dict
	end
  end
end

