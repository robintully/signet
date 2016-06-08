describe "user creation", type: :feature do
 sign_up_user

 let(:user) { User.find_by(name: "test test") }

  it "creates a user" do
    expect(user).to_not be_nil
  end

  it "confirm creation by visiting envelope creation page" do
    visit new_envelope_path
    expect(current_path).to eq(new_envelope_path)
  end


end