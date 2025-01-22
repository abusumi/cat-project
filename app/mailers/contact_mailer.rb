class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to:   ENV["MAIL_ADDRESS"], title: "【お問い合わせ】" + @contact.title
  end
end
