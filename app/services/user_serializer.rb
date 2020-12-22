class UserSerializer 
 def initialize(user_object)
  @user = user_object
 end

 def to_serialized_json
  @user.to_json(:only => [:username, :email], :include => {:reading_lists => {:only => [:id, :name, :type], :include => {:reading_list_books => {:include => {:book => {:only => [:title, :author, :published_year, :genre, :description, :pages]}}}}}})
 end


end