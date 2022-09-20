# To deliver this notification:
#
# NewAnnouncement.with(post: @post).deliver_later(current_user)
# NewAnnouncement.with(post: @post).deliver(User.all)

class NewAnnouncement < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add your delivery methods
  #
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :announcement, :user

  # Define helper methods to make rendering easier.
  #
  # `message` and `url` are used for rendering in the navbar

  def message
    t(".hello")
  end

  def url
    # You can use any URL helpers here such as:
    # post_path(params[:post])
    root_path
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
      # browser: {
      #   title: "",
      #   options: {}
    }
  end
end
