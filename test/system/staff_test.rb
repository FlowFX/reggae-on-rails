# frozen_string_literal: true

require 'application_system_test_case'

class VisitorTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    @events = create_list(:event, 3)

    @user = create(:user)
    login_as(@user, scope: :user)
  end

  test 'Jahshua wants to look up all events that ever happened anywhere' do
    # Jahshua visits the events index page.
    visit '/events/'

    # Many existing events are shown.
    assert page.find_all('tr').count.positive?

    # He wants to create a new event
    click_on 'Nuevo evento'

    # He is shown the event create form and he enters the information
    within('form') do
      fill_in 'Título', with: 'My awesome party'
      fill_in 'Descripción', with: "Look, just because I don't be givin' no man a
      foot massage don't make it right for Marsellus to throw Antwone into a
      glass motherfuckin' house, fuckin' up the way the nigger talks.
      Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll
      kill the motherfucker, know what I'm sayin'?"

      # After he is finished, he clicks on the submit button,
      # TODO: Finish the test
      #find('input#commit')
    end
  end
end
