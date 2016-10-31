require './spec/spec_helper'
feature "Sign in page for MDLIVE" do

  def login
    visit ('/')
    find("a.showlogin").click

    fill_in 'login[email]', :with => 'demopatient5'
    fill_in 'login[password]', :with => 'mdlive123'

    click_button "Sign In"
    expect(page).to have_content("My Health")
  end

  def sign_in_for_video_appointment

    select "FLORIDA", :from => 'available_state'
    click_button "confirmUserLocationButton"
    # sleep 2
    expect(page).to have_content("See a Doctor")
    click_link "See a Doctor"
    expect(page).to have_content("Choose First Available")
    click_button "Choose First Available"
    find('.video').click
    click_button "Continue"
    fill_in 'chief_complaint', :with => 'Sore Throat'
    sleep 2
    click_button "Continue"
    all('input[value=no]').map(&:choose)
    click_link 'Continue'
    click_link 'Continue'
    click_link ('btnOk')
    find('.chosen-single').click
    find('.chosen-drop').all('li').each{|li| li.click if li.text == 'Urgent Care'}
    check 'terms_of_use'
    check 'health_summary'
    fill_in 'initials', :with => 'dd'
    find(:xpath, '//input[@value="Create Appointment"]').click
  end


  context "A valid account" do

    before(:each) do
      login
    end

    it 'should be allowed to have OCWR functionality' do
     sign_in_for_video_appointment
  #    # wait_for_content('', 5)
    end

end
end
