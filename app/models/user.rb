class User < ApplicationRecord

  has_secure_password
  has_secure_token :confirmation_token

    # validates :username,
    #   format: {with: /\A[a-zA-Z0-9_]{2-20}\z/, message: 'ne doit contenir que des caractères alphanumériques ou des _'},
    #   uniqueness: {case_sensitive: false}

    validates :username,
      :presence => true,
      :uniqueness => { :case_sensitive => false },
      :format => { with: /\A[a-zA-Z]+\z/ },
      :length => { in: 4..20 }
    validates :email, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},
      uniqueness: {case_sensitive: false}

      def to_session

        {id: id}

      end

end
