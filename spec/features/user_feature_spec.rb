describe "user creation", type: :feature do
  # before do
  #   visit sign_up_path
  #   fill_in "Name", with: "Steven Nuñez"
  #   fill_in "Email address", with: "beeflover101@flatironschool.com"
  #   fill_in "Password", with: "secretvegetarian"
  #   fill_in "Password confirmation", with: "secretvegetarian"
  #   click_button "Register User"
  # end
  sign_up_user

  let(:user) { User.find_by(name: "Steven Nuñez") }

  it "creates a user" do
    expect(user).to_not be_nil
  end

  it "redirects to the envelope creation page" do
    expect(current_path).to eq(root_path)
  end


end