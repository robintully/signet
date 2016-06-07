describe "parchment creation", type: :feature do
  let(:user) { User.create(name: "Steven Nuñez",  email_address:"beeflover101@flatironschool.com",email_confirmed: true, password_digest: "whatever") }
 sign_up_user
 sign_in_user



  #  before(:each) do
  #   {'user_id' => 78}
  # end


  feature 'User can create an envelope' do
    scenario 'they see the show page of the new envelope' do
       session[:user_id] ||= user.id
      visit new_envelope_path
      click_button 'Create Envelope'
      binding.pry
      expect(page).to have_css("a", :text => "Creatsdfor: Steven Nuñez")
    end
  end



  feature 'User can see their envelopes' do
    scenario 'the index page shows all of the users envelopes' do
      5.times {|n| Envelope.create(user_id: user.id, slug: n, expiration: 1.hour.from_now)}
      visit envelopes_path

      expect(page).to have_css("h2", :text => "Slug: 0")
      expect(page).to have_css("h2", :text => "Slug: 1")
      expect(page).to have_css("h2", :text => "Slug: 2")
      expect(page).to have_css("h2", :text => "Slug: 3")
      expect(page).to have_css("h2", :text => "Slug: 4")
    end

    scenario 'Envelopes show page show their parchments' do
      test = Envelope.create(user_id: user.id, slug: "test", expiration: 1.hour.from_now)
      x =  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/screenshot.png')))
      y =  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/pry_logo.png')))
      Parchment.create(envelope: test, file: x)
      Parchment.create(envelope: test, file: y)
      visit envelope_path(test)
      expect(page).to have_css("a", :text => "screenshot.png")
      expect(page).to have_css("a", :text => "pry_logo.png")
    end
  end

  


end