# frozen_string_literal: true

require 'application_system_test_case'

class VisitorTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
  end

  test 'Jahshua wants to log into the application' do
    # Jahshua visits the home page,
    visit '/'

    # and clicks on the login link.
    click_on 'Sign In'

    # In the login form, he enters his email address and password.
    within('form') do
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password

      click_on 'Log in'
    end

    # After clicking the submit button, he is greeted with a success message.
    assert page.has_content? 'Ingreso exitoso'
  end
end
