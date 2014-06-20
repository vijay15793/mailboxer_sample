class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable, :lockable,
        # :recoverable, :rememberable, :trackable, :validatable,:confirmable,:timeoutable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :address_line_1, :address_line_2, :city, :state, :pin_code, :contact_no, :alt_contact_no, :ref_email, :campus_id, :role
  validates :password, :presence => true,
                       :length => { :minimum => 8 }
  validates :password_confirmation, :presence => true
  
  
  ROLES = %w[banned learner mentor intern employee admin superadmin]
  def role?(base_role)
     if self.role
        ROLES.index(base_role.to_s) <= ROLES.index(self.role)
     end
  end

end
