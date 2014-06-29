class MessagesController < ApplicationController
  before_filter :authenticate_user!
  #load_and_authorize_resource :except=> [:show,:sentbox,:inbox,:trashed],:message => 'Not authorized User.'
  def new
    if params[:user_id]
      @user=User.find(params[:user_id])
    end
    session[:return_to] = nil
    session[:return_to] ||= request.referer
  end
  
  def send_msg
     user_ids = params[:user_id]
     if user_ids.count == 1
      recipients = User.find(user_ids)
     else
       recipients = User.where(id: user_ids).all
     end
    #current_user.send_message(@user, body_of_the_message, subject_of_the_message)
    body_of_the_message = params[:msg][:body]
   
    subject_of_the_message = params[:msg][:subject] || "No subject"
    current_user.send_message(recipients,body_of_the_message, subject_of_the_message)
    flash[:notice]="succesfully sent message"
    if session[:return_to]
      redirect_to session[:return_to]
    else
      redirect_to 'show'
    end
  end
  
  def show

    @conversations=Kaminari.paginate_array(current_user.mailbox.conversations).page(params[:page]).per(10)
   
  end
  
  def sentbox
    @sentbox=Kaminari.paginate_array(current_user.mailbox.sentbox).page(params[:page]).per(10)
  end
  
  def inbox
    @inbox=Kaminari.paginate_array(current_user.mailbox.inbox).page(params[:page]).per(10)
  end
  
  def all_message
    @conversation = Mailboxer::Conversation.find(params[:id])
    if not @conversation.participants.include? current_user
      flash[:error]="Not authorized for This"
    end
  end
  

  
   def replied
    @conversation = Mailboxer::Conversation.find(params[:id])
    if not @conversation.participants.include? current_user
      flash[:error]="Not authorized for This"
    else
      current_user.reply_to_conversation(@conversation,params[:reply_msg][:body])
      flash[:notice]="replied successfully "
    end
    redirect_to  :back
  end
  
  def trashed
    @trash = Kaminari.paginate_array(current_user.mailbox.trash).page(params[:page]).per(10)
  end

  def trash
    @conversation = Mailboxer::Conversation.find(params[:id])
    if not @conversation.participants.include? current_user
      flash[:error]="Not authorized for This"
    else 
      @conversation.move_to_trash(current_user)
      flash[:notice]="Moved to trash"
    end
    redirect_to :back
  end

  def untrash
    @conversation = Mailboxer::Conversation.find(params[:id])
    
     if not @conversation.participants.include? current_user
      flash[:error]="Not authorized for This"
    else 
      @conversation.untrash(current_user)
      flash[:notice]="Succesfully untrashed"
    end
    redirect_to :back
  end

end
