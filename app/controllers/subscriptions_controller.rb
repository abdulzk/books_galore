class SubscriptionsController < ApplicationController
  layout "subscribe"
  before_action :authenticate_user!, excpet: [:new, :crew]

  def new
    if user_signed_in? && current_user.subscribed?
      redirect_to root_path, notice: "You are already subscribed!"
    end
   end

   def create
     Stripe.api_key = Rails.application.credentials.stripe_api_key

     plan_id = params[:plan_id]
     plan = Stripe::Plan.retrieve(plan_id)
     token = params [:stripeToken]

    # For when a customer was once subscribed, unsubscribed, then subscribed again
    # to keep the same information of that customer
     customer = if current_user.stripe_id?
       Stripe::Customer.retrieve(current_user.stripe_id)
     else
       Strip::Customer.create(email: current_user.email, source: token)
     end

     subscription = customer.subscriptions.create(plan: plan.id)

     options = {
       stripe_id: customer.id,
       stripe_subscription_id: subscription.id,
       subscribed: true
     }

     # if the user ever updates their card
     options.merge!(
      card_last4: params[:user][:card_last4],
      card_exp_month: params[:user][:card_exp_month],
      card_exp_year: params[:user][:card_exp_year],
      card_type: params[:user][:card_type]
    ) if params[:user][:card_last4]

    current_user.update(options)

    redirect_to root_path, notice: "Success! You are good to go."
  end

  # to cancel a subscription
  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    current_user.subscribed = false

    redirect_to root_path, notice: "Your subscription has been cancelled. Sorry to see you go!"

   end
end
