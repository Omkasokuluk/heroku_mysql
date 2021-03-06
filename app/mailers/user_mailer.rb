class UserMailer < ApplicationMailer
  default from: 'socialhubs2016@gmail.com'

  def welcome_email(user,id,org,author)
    @author=author
    @user = user
    # @admin = AdminUser.first
    @org = org
    @id = id
    @url  = 'http:46.101.108.2/admin/organizations/' + @id.to_s + '/edit'
    @url1  = 'http:localhost:3000/admin/organizations/' + @id.to_s + '/edit'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def aid_reply(user,author)
    @user = user
    @author = author
    mail(to: author.email, subject: 'Omurbek')
    mail(to: user.email, subject: 'Gilani')
  end

  def notification(user,id,org)
    @user = user
    @org = org
    @id = id
    mail(to: @user.email,subject: 'organization confirmed')
  end
end
