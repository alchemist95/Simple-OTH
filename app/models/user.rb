class User < ActiveRecord::Base

	enum role: [
				:victor,
				:player
               ]

	class << self
		$found_or_created=0

		def create_with_omniauth(auth)
			uid=auth.uid
			info=auth.info.symbolize_keys!
			if User.exists?(uid: uid)
				user=User.find_by(uid: uid)
				$found_or_created=1
			else
				user=User.create(uid: uid)
				user.name=info.name
				user.provider=auth.provider
				user.image_url=info.image
				user.role=1
				$found_or_created=2
			end
			user.save!
			user
		end

		def f_o_c
		    return $found_or_created
		end

	end
end
