require 'rails_helper'

RSpec.describe ActivateMailer, type: :mailer do
  let(:email){ Capybara::Node::Simple.new(email.body.to_s)}

  it "Sends activation link" do
    user = create(:user)
    email = ActivateMailer.register(user)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['no_reply@brownfield.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Activate Your Brownfield Account', email.subject
  end

  it "Sends activation link" do
    user = {email: "jake0miller@gmail.com"}
    email = ActivateMailer.invite(user, "jake0miller")

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['no_reply@brownfield.com'], email.from
    assert_equal [user[:email]], email.to
    assert_equal 'Invite to Brownfield', email.subject
  end
end
