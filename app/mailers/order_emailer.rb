class OrderEmailer < ActionMailer::Base
  default :from => 'Sto.ck <pals@sto.ck>'

  # TODO make the Amazon API call
  # to generate the purchase link here
  def order_notification(user)
    @user = user
    @items = @user.items.out_of_stock

    mail :subject => "Keep these items in Sto.ck",
      :to => user.email
  end
end
