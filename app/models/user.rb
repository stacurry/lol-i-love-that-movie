class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validate :password_not_blank

  def password_not_blank
    if password == ""
      errors.add(:password, "can't be blank")
    end
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(args)
    existing_user = find_by(email: args[:email])
    if existing_user && existing_user.password == args[:password]
      existing_user
    else
      nil
    end
  end
end
