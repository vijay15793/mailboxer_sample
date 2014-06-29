class User < ActiveRecord::Base
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable, :lockable,
        # :recoverable, :rememberable, :trackable, :validatable,:confirmable,:timeoutable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :address_line_1, :address_line_2, :city, :state, :pin_code, :contact_no, :alt_contact_no, :ref_email, :campus_id, :role
  validates :password, :presence => true,
                       :length => { :minimum => 8 }

  
  
  ROLES = %w[banned learner mentor intern employee admin superadmin]
  def role?(base_role)
     if self.role
        ROLES.index(base_role.to_s) <= ROLES.index(self.role)
     end
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    email
    #if false
    #return nil
  end
end
