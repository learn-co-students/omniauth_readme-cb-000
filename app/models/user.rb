class User < ActiveRecord::Base
  def self.find_or_create_by_omniauth(omniauth_hash)
    where(uid: omniauth_hash['uid'], provider: omniauth_hash['provider']).
      first_or_create do |u|
        u.name = omniauth_hash['info']['nickname']
        u.email = omniauth_hash['info']['email']
      end
  end
end
