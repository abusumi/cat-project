class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    if request.post?
      @contact = Contact.new(contact_params)
      if @contact.invalid?
        flash[:alert] = @contact.errors.full_messages.join(", ")
        @contact = Contact.new
        render :new
        return
      end
      session[:contact_data] = contact_params # ← セッションにデータを保存
    else
      @contact = Contact.new(session[:contact_data] || {})
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_contacts_path
    else
      flash[:alert] = @contact.errors.full_messages.join(", ")
      @contact = Contact.new
      render :new
    end
  end

  def done
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :title, :message)
  end
end
